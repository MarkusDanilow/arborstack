import fp from "fastify-plugin";
import { FastifyInstance, FastifyError } from "fastify";

async function errorHandlerPlugin(app: FastifyInstance) {
  app.setErrorHandler((error: FastifyError, _request, reply) => {
    const statusCode = error.statusCode ?? 500;

    app.log.error(
      { err: error, statusCode },
      `[ErrorHandler] ${error.message}`
    );

    // Validation errors from Fastify's JSON Schema validator
    if (error.validation) {
      return reply.status(400).send({
        success: false,
        statusCode: 400,
        error: "Validation Error",
        message: error.message,
        details: error.validation,
      });
    }

    // Generic error response — never leak stack traces in production
    return reply.status(statusCode).send({
      success: false,
      statusCode,
      error: statusCode >= 500 ? "Internal Server Error" : error.name,
      message:
        statusCode >= 500 && process.env["NODE_ENV"] === "production"
          ? "An unexpected error occurred"
          : error.message,
    });
  });
}

export const errorHandler = fp(errorHandlerPlugin, {
  name: "error-handler",
});

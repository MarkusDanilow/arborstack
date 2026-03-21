// Barrel export for all shared TypeScript types / interfaces
// Expand this file as the API grows

export interface ApiResponse<T> {
  success: boolean;
  data: T;
}

export interface ApiErrorResponse {
  success: false;
  statusCode: number;
  error: string;
  message: string;
}

export interface PaginatedResponse<T> extends ApiResponse<T[]> {
  total: number;
  page: number;
  pageSize: number;
}

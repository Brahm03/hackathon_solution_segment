class DomainResult {}

class DomainSuccess<T> extends DomainResult {
  final T? data;
  final String? message;

  DomainSuccess({
    this.data,
    this.message,
  });
}

class DomainError extends DomainResult {
  final String? message;

  DomainError({
    this.message,
  });
}

class DomainLoading extends DomainResult {}

class DomainValidationError extends DomainResult {}

class DomainUnAuthorized extends DomainResult {}

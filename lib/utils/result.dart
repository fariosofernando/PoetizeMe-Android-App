class Result<T> {
  final T? value;
  final String? error;

  bool get isSuccess => error == null;

  Result.success(this.value) : error = null;

  Result.failure(this.error) : value = null;
}

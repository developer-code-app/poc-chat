extension ExtendedNullable<T> on T? {
  T getOrElse(T orElse) => (this == null) ? orElse : this!;

  T getOrThrow({required String errorMessage}) {
    if (this == null) throw Exception(errorMessage);

    return this!;
  }

  T getOrThrowException(Exception error) {
    if (this == null) throw error;

    return this!;
  }
}

extension ExtendedNullableIterable<T> on Iterable<T>? {
  Iterable<T> getOrEmpty() => (this == null) ? [] : this ?? [];

  bool get isEmpty => (this == null) || getOrElse([]).isEmpty;

  bool get isNotEmpty => !isEmpty;
}

extension ExtendedNullableString<String> on String? {
  String? nullIfEmpty() => (this == null || this == '') ? null : this;
}

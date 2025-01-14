class UIState<T> {
  final bool isLoading;
  final T? data;
  final String? error;

  const UIState({
    this.isLoading = false,
    this.data,
    this.error,
  });

  factory UIState.initial() => UIState<T>();
  factory UIState.loading() => UIState<T>(isLoading: true);
  factory UIState.success(T data) => UIState<T>(data: data);
  factory UIState.error(String message) => UIState<T>(error: message);

  bool get isInitial => !isLoading && data == null && error == null;
  bool get isSuccess => !isLoading && data != null && error == null;
  bool get isError => !isLoading && error != null;

  UIState<T> copyWith({
    bool? isLoading,
    T? data,
    String? error,
  }) {
    return UIState<T>(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}

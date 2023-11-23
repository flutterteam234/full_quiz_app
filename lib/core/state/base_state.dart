class BaseState {
  const BaseState({this.isLoading = true, this.isPress = false});

  final bool isLoading;
  final bool isPress;

  List<Object?> get props => [isLoading, isPress];

  BaseState copyWith({
    bool? isLoading,
    bool? isPress,
  }) {
    return BaseState(
      isLoading: isLoading ?? this.isLoading,
      isPress: isPress ?? this.isPress,
    );
  }
}

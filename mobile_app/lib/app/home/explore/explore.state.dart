part of 'explore.cubit.dart';

@immutable
abstract class ExploreState extends Equatable {
  const ExploreState();
}

class ExploreStateInitial extends ExploreState {
  const ExploreStateInitial();

  @override
  List<Object> get props => [];
}

class ExploreStateLoading extends ExploreState {
  const ExploreStateLoading();

  @override
  List<Object> get props => [];
}

class PanelSlideOffsetChanged extends ExploreState {
  final double slideOffset;

  PanelSlideOffsetChanged(this.slideOffset);

  @override
  List<Object> get props => [slideOffset];
}

class PanelSlideReachMaxHeight extends ExploreState {
  final bool isSwipeUp;

  PanelSlideReachMaxHeight(this.isSwipeUp);

  @override
  List<Object> get props => [isSwipeUp];
}

class ExploreStateError extends ExploreState {
  final String message;

  const ExploreStateError(this.message);

  @override
  List<Object> get props => [message];
}

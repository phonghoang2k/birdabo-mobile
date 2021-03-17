import 'dart:math';

import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'explore.state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  double offset = SizeConfig.safeBlockVertical * 18;
  bool isSwipeUp = false;
  double panelHeight = SizeConfig.safeBlockVertical * 82;

  ExploreCubit() : super(ExploreStateInitial()) {}

  void handlePanelOffsetChange(double position) {
    offset = SizeConfig.safeBlockVertical * 18 + min(position, 0.4) * panelHeight;
    emit(PanelSlideOffsetChanged(offset));
    isSwipeUp && position != 1 ? {isSwipeUp = false, emit(PanelSlideReachMaxHeight(isSwipeUp))} : {};
  }

  @override
  void onChange(Change<ExploreState> change) {
    print(change.nextState.props);
    super.onChange(change);
  }

  void handlePanelReachMaxHeight() {
    isSwipeUp = true;
    emit(PanelSlideReachMaxHeight(isSwipeUp));
  }
}

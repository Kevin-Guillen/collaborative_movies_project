import 'package:flutter/material.dart';
import 'state_type.dart';
import 'states/card_swiper_state_empty.dart';
import 'states/movies_state_error.dart';
import 'states/movies_state_loading.dart';
import 'states/card_swiper_state_success.dart';
import 'widgets/homeScreenWidgets/card_swiper.dart';

class CardSwiperEvents extends StatelessWidget {
  final StateType state;
  final bool isTextFieldEmpty;

  const CardSwiperEvents({
    required this.state,
    required this.isTextFieldEmpty,
  });

  Widget _buildContent(BuildContext context) {
    switch (state.stateType) {
      case MoviesStateType.loading:
        return CardSwiper(
          isTextFieldEmpty: true,
          swiperChild: MoviesStateLoading(),
        );
      case MoviesStateType.empty:
        return CardSwiper(
          isTextFieldEmpty: false,
          swiperChild: CardSwiperStateEmpty(),
        );
      case MoviesStateType.success:
        return CardSwiper(
          isTextFieldEmpty: isTextFieldEmpty,
          swiperChild: CardSwiperStateSuccess(
            state: state,
          ),
        );
      case MoviesStateType.error:
        return MoviesStateError();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}

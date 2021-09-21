import 'dart:async';
import '../events.dart';
import '../state_type.dart';
import 'bloc.dart';

abstract class IMoviesBloc extends Bloc {
  Stream<StateType> get cardSwiperMoviesStream;

  Stream<StateType> get gridMoviesStream;

  void getMoviesState(Events event, [String movieName = ""]);

  void fetchByMovieName(String textField);

  bool get isTextFieldEmpty;
}

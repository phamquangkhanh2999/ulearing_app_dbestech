import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_events.dart';
import 'package:ulearning_app/page/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvent>((event, emit){
      emit(WelcomeState(page: state.page));
    });
  }
}
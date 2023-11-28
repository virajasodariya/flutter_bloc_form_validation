import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/Bloc/login_event.dart';
import 'package:flutter_bloc_form_validation/Bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(LoginErrorState(
            errorMessage: "Please enter a valid email address!"));
      } else if (event.passwordValue.length < 8) {
        emit(LoginErrorState(errorMessage: "Please enter a valid password!"));
      } else {
        emit(LoginInvalidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) => emit(LoginLoadingState()));
  }
}

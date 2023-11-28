abstract class LoginEvent {}

class LoginTextChangeEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;

  LoginTextChangeEvent({required this.emailValue, required this.passwordValue});
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmittedEvent({required this.email, required this.password});
}

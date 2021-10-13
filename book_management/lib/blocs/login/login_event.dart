abstract class LoginEvent {

}

class LoginUsernameChange extends LoginEvent{
  final String username;
  LoginUsernameChange({required this.username});
}

class LoginPasswordChange extends LoginEvent{
  final String password;
  LoginPasswordChange({required this.password});
}

class LoginSubmitted extends LoginEvent{
}
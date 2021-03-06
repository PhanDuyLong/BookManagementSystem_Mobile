import 'package:book_management/blocs/login/form_submission_status.dart';

class LoginState{
  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  LoginState({
    this.username='',
    this.password='',
    this.formStatus = const InitalFormStatus(),
  });

  LoginState copyWith({
    String? username, 
    String? password,
    FormSubmissionStatus? formStatus
  }) {
    return LoginState(
      username: username?? this.username,
      password: password?? this.password,
      formStatus: formStatus?? this.formStatus,
    );
  }
}
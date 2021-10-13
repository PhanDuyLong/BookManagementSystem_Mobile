import 'package:book_management/blocs/login/form_submission_status.dart';
import 'package:book_management/blocs/login/login_event.dart';
import 'package:book_management/blocs/login/login_state.dart';
import 'package:book_management/resouces/login_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginProvider loginProvider;

  LoginBloc(this.loginProvider) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginUsernameChange) {
      yield state.copyWith(username: event.username);

    } else if(event is LoginPasswordChange) {
      yield state.copyWith(password: event.password);

    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await loginProvider.login(state.username, state.password);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
  }
}
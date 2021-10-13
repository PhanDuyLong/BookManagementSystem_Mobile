import 'package:book_management/blocs/book_form/book_form_bloc.dart';
import 'package:book_management/blocs/book_form/book_form_state.dart';
import 'package:book_management/blocs/book_list/book_list_bloc.dart';
import 'package:book_management/blocs/book_list/book_list_event.dart';
import 'package:book_management/blocs/book_list/book_list_state.dart';
import 'package:book_management/blocs/login/form_submission_status.dart';
import 'package:book_management/blocs/login/login_bloc.dart';
import 'package:book_management/blocs/login/login_event.dart';
import 'package:book_management/blocs/login/login_state.dart';
import 'package:book_management/resouces/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc(
            context.read<LoginProvider>()
            ),
            child: _loginForm(),
          ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if(formStatus is SubmissionFailed) {
          _showSnackBar(context, 'Invalid username or password');
        } else if(formStatus is SubmissionSuccess) {
          Navigator.of(context).push(
              MaterialPageRoute<HomePage>(
                builder: (context) {
                  return MultiBlocProvider(
          providers: [
            BlocProvider<BookListBloc>(
              create: (context) => BookListBloc(InitialBookListState())
                ..add(GetBooks(query: "")),
            ),
            BlocProvider<BookFormBloc>(
              create: (context) => BookFormBloc(InitialBookFormState()),
            ),
          ],
          child: HomePage(),
        );
                },
              ),
            );
        }
      },
      child: Form(
          child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _usernameField(),
                _passwordField(),
                _loginButton(),
              ],
            ),),));
      }
  

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Username'
        ),
        validator: (value) => null,
        onChanged: (value) => context.read<LoginBloc>()
        .add(LoginUsernameChange(username: value)),
      );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.security),
          labelText: 'Password'
        ),
        validator: (value) => null,
        onChanged: (value) => context.read<LoginBloc>()
        .add(LoginPasswordChange(password: value)),
      );
            },);
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting 
        ? Center(
          child: CircularProgressIndicator(),
        )
        : ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(LoginSubmitted());
          }, 
          child: Text('Login'),
          );
      }
    );
  }

  void _showSnackBar(BuildContext context, String mess) {
    final snackBar = SnackBar(content: Text(mess));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}
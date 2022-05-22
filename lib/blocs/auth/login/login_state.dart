part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginUsernameChanged extends LoginState {}

class LoginPasswordChanged extends LoginState {}

class LoginSubmitted extends LoginState {}

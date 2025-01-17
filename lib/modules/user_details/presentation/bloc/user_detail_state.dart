import 'package:flutter/material.dart';
import 'package:mobile_challenge/shared/entities/User.dart';

@immutable
abstract class UserDetailState {}

class Empty extends UserDetailState {}

class Loading extends UserDetailState {}

class Loaded extends UserDetailState {
  final User user;

  Loaded({@required this.user});
}

class Error extends UserDetailState {
  final IconData icon;
  final String message;

  Error({@required this.message, this.icon});
}

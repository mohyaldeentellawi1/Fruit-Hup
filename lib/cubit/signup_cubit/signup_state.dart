import 'package:flutter/material.dart';
import 'package:fruit_hup/core/entities/user_entity.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity user;
  SignupSuccess({required this.user});
}

final class SignupFailure extends SignupState {
  final String error;
  SignupFailure({required this.error});
}

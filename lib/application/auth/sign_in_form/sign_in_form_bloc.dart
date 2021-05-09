import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_todo_app/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_todo_app/domain/auth/auth_failure.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_todo_app/domain/auth/i_auth_facade.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  // SignInFormBloc(SignInFormState initialState) : super(initialState); //エラー回避用

  @override
  SignInFormState get initialState => SignInFormState.initial();
  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

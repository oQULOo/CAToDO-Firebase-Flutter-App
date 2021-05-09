import 'package:dartz/dartz.dart';
import 'package:firebase_todo_app/domain/auth/auth_failure.dart';
import 'package:firebase_todo_app/domain/auth/value_objects.dart';
import 'package:flutter/material.dart';

///FLutterはインターフェースがないので、クラス名をIからはじめることを規則とする
abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPasswowrd({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPasswowrd({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  ///Googleサインインなので、ここでアドレスやパスワードはいらない
  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  ///正しい値の場合は文字列型で返す
  Future<Either<AuthFailure, String>> returnAValueString();
}

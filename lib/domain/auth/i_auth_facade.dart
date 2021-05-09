import 'package:firebase_todo_app/domain/auth/value_objects.dart';
import 'package:flutter/material.dart';

///FLutterはインターフェースがないので、クラス名をIからはじめることを規則とする
abstract class IAuthFacade {
  Future<void> registerWithEmailAndPasswowrd({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<void> signInWithEmailAndPasswowrd({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  ///Googleサインインなので、ここでアドレスやパスワードはいらない
  Future<void> signInWithGoogle();
}

import 'package:dartz/dartz.dart';
import 'package:firebase_todo_app/domain/auth/email_address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

///ValueObjectクラスのフィールドは不変！再代入だめ！
@immutable

///アドレス・パスワードが有効か無効化を検証するための抽象クラス
abstract class ValueObject<T> {
  const ValueObject();

  ///Either<エラー扱いとなるLeftの値<Leftの型：String>,正しいRightの型：String>
  ///すべての値がStringとも限らないのでジェネリクスにしておく
  Either<ValueFailure<T>, T> get value;

  ///data equalityの確認
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  ///入力されたメールアドレスをStringへ
  @override
  String toString() => 'Value($value)';
}

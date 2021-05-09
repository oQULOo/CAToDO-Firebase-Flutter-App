import 'package:dartz/dartz.dart';
import 'package:firebase_todo_app/domain/core/failures.dart';
import 'package:firebase_todo_app/domain/core/value_objects.dart';
import 'package:firebase_todo_app/domain/core/value_validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

class EmailAddress extends ValueObject<String> {
  ///Either<エラー扱いとなるLeftの値<Leftの型：String>,正しいRightの型：String>
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    ///assert でアドレスがnull以外の値が入っていることを確認、入っていない場合実行中段される
    assert(input != null); //外部から呼び出されるタイミングでnullチェック
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  ///コンストラクター constにしておく
  const EmailAddress._(this.value);

  @override
  int get hashCode => value.hashCode;
}

///パスワードも同様に検証
class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);

  @override
  int get hashCode => value.hashCode;
}

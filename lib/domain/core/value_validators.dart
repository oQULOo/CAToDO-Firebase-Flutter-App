import 'package:dartz/dartz.dart';
import 'package:firebase_todo_app/domain/auth/value_objects.dart';

import 'failures.dart';

///アドレスの正規性を検証するクラス regex：正規表現のこと
Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    ///正規表現チェックを通過した正しいアドレスはright…正しいを表す右辺に入る
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

///パスワード用
Either<ValueFailure<String>, String> validatePassword(String input) {
  ///パスワードが6文字以上：正しい値/5文字以下：無効
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

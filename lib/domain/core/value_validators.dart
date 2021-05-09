import 'package:dartz/dartz.dart';
import 'package:firebase_todo_app/domain/auth/value_objects.dart';

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

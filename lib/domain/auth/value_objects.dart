import 'package:dartz/dartz.dart';
import 'package:firebase_todo_app/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'value_objects.freezed.dart';

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

///Freezedの使用 無効な値に対してエラーをスローするための抽象クラス
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  ///アドレス用
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;

  ///パスワード用
  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}

///無効なアドレスが入力された場合エラー文を表示する
void showingTheEmailAddressOrFailure() {
  final emailAddress = EmailAddress('まちがってるヨアドレス');

  ///無効なアドレスなのでLeft側に入れたい→foldメソッドを使用
  String emailText = emailAddress.value.fold(
      (left) => 'Failure happened, more precisely: $left', (right) => right);

  ///上記で拾いきれないエラー
  String emailText2 =
      emailAddress.value.getOrElse(() => 'Some failure happened');
}

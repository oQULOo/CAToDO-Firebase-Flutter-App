import 'package:firebase_todo_app/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

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


///チュートリアル用？
/* 
///無効なアドレスが入力された場合エラー文を表示する
void showingTheEmailAddressOrFailure() {
  final emailAddress = EmailAddress('まちがってるヨアドレス');

  ///無効なアドレスなのでLeft側に入れたい→foldメソッドを使用
  String emailText = emailAddress.value.fold(
      (left) => 'Failure happened, more precisely: $left', (right) => right);

  ///上記で拾いきれないエラー
  String emailText2 =
      emailAddress.value.getOrElse(() => 'Some failure happened');
}*/

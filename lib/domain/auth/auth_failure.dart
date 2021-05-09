import 'package:firebase_todo_app/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';

/*
* 認証で失敗するパターン
1.ユーザーがサードパーティのサインインフローから "タップアウト:キャンセル "した場合(ここではGoogle)。
2.認証サーバーでエラーが発生した場合
3.ユーザーが既に使用されているメールで登録しようとした場合
4.ユーザーがメールアドレスとパスワードの組み合わせを誤って入力した場合
* =>ここで定義して、IAuthFacadeクラスで使用する
*/

@freezed
abstract class AuthFailure with _$AuthFailure {
  ///1.ユーザーがGoogleサインインを途中でキャンセルした場合
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  ///2.サーバーエラー
  const factory AuthFailure.serverError() = ServerError;

  ///3.ユーザーが既に使用されているアドレスで登録しようとした場合
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  ///4.アドレスとパスワードの組み合わせを誤って入力した
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}

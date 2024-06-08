import 'package:auto_route/auto_route.dart';
import 'package:auto_route_auth_app/presentation/router.gr.dart';
import 'package:auto_route_auth_app/provider/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_guard.g.dart';

@Riverpod(keepAlive: true)
AuthGuard authGuard(AuthGuardRef ref) {
  return AuthGuard(ref: ref);
}

class AuthGuard extends AutoRouteGuard {
  Ref ref;
  AuthGuard({required this.ref});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // resolver.next()が呼び出されるまで、ナビゲーションは一時停止されます。
    // ナビゲーションを再開/継続するにはtrueを、ナビゲーションを中止するにはfalseを返します。
    // authenticatedは、FirebaseAuthの現在のユーザーがnullでない場合にtrueになります。

    // Providerを使用して認証状態を取得します。
    final isAuth = ref.read(streamAuthNotifierProvider).asData?.value != null;
    if (isAuth) {
      // ユーザーが認証された場合、続行する
      resolver.next(true);
    } else {
      // ユーザーをログインページにリダイレクトする
      // tip: resolver.redirectを使用して、リダイレクトされたルート
      // リゾルバが完了したときにスタックから自動的に削除されます。
      resolver.redirect(const SignInRoute());
    }
  }
}

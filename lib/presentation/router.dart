import 'package:auto_route/auto_route.dart';
import 'package:auto_route_auth_app/presentation/auth_guard.dart';
import 'package:auto_route_auth_app/presentation/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

@Riverpod(keepAlive: true)
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter(ref: ref);
}

// fvm flutter pub run build_runner watch --delete-conflicting-outputs

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  final Ref ref;
  AppRouter({required this.ref});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        // ガードを使用して認証されたユーザーのみがアクセスできるページ
        AutoRoute(page: WelcomeRoute.page, guards: [AuthGuard(ref: ref)]),
      ];
}

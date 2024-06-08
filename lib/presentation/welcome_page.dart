import 'package:auto_route/auto_route.dart';
import 'package:auto_route_auth_app/presentation/router.gr.dart';
import 'package:auto_route_auth_app/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // AppBarの戻るボタンを非表示にする
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(firebaseAuthProvider).signOut();

              /// [ログアウト後の処理]
              /// signOutしても画面遷移はしないので手動で行う必要がある。
              if (context.mounted) {
                context.router.replace(const SignInRoute());
              }
            },
          ),
        ],
        title: const Text('Welcome to Riverpod!'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Riverpod!'),
          ],
        ),
      ),
    );
  }
}

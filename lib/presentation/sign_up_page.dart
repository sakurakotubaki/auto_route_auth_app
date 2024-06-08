import 'package:auto_route/auto_route.dart';
import 'package:auto_route_auth_app/presentation/router.gr.dart';
import 'package:auto_route_auth_app/provider/auth.dart';
import 'package:auto_route_auth_app/provider/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(streamAuthNotifierProvider, (previous, next) {
      if (next.asData?.value != null) {
        context.router.replace(const WelcomeRoute());
      } else {
        //  ユーザーが新規作成されなかったら処理を終了する。
        return;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await ref
                        .read(firebaseAuthProvider)
                        .createUserWithEmailAndPassword(
                            email: email.text, password: password.text);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

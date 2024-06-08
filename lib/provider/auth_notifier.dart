import 'package:auto_route_auth_app/provider/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_notifier.g.dart';

/// [認証状態を監視するプロバイダー]
@riverpod
class StreamAuthNotifier extends _$StreamAuthNotifier {
  @override
  Stream<User?> build() async* {
    yield* authStateChangeFunction();
  }

  Stream<User?> authStateChangeFunction() async* {
    yield* ref.read(firebaseAuthProvider).authStateChanges();
  }
}

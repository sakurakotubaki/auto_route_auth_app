import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth.g.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

// FirebaseAuthのプロバイダー
@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<MyUser> signUp(MyUser email, String password);

  Future<void> signIn(String email, String password);

  Future<void> signOut();

  Future<void> resetPassword(String email);

  Future<MyUser> signInWithGoogle();

  Future<void> setUserData(MyUser user);

  Future<MyUser> getUserData(String userId);
}

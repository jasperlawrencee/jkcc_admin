import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  /// See each method for explanation of what it does.
  /// check ../user_repo.dart for the abstract class
  FirebaseUserRepository({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );

      // put to user class to submit to return MyUser value
      myUser = myUser.copyWith(id: user.user!.uid, email: myUser.email);

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Google sign in aborted');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final MyUser myUser = MyUser(
          id: user.uid,
          email: user.email ?? '',
          name: user.displayName ?? '',
          picture: user.photoURL ?? '',
        );

        return myUser;
      } else {
        throw Exception('Google sign in failed');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      /***
       * updates the user data in the firebase collection "users" where the MyUser class gets converted
       * to a MyUserEntity class which is a JSON form of the MyUser class using the toEntity() method
       * finally having the toDocument() method to convert the MyUserEntity class to a Map<String, dynamic>
       ***/
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getUserData(String userId) {
    try {
      //*
      //* gets the user data from firestore collection "users" using the userId parameter
      //* converts it to a MyUserEntity class using the fromDocument() method to be passed to the
      //* MyUser class using the fromEntity() method
      //* finally returning the MyUser class
      //* which is the final output of this method and can now be used to display user data locally
      //*//
      return usersCollection
          .doc(userId)
          .get()
          .then(
            (snapshot) =>
                MyUser.fromEntity(MyUserEntity.fromDocument(snapshot.data()!)),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  /// Stream of [MyUser] will emit the current user data when authentication state changes
  /// Emits [MyUser.empty] if the user is not authenticated (not logged in)
  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((snapshot) {
      final user = snapshot;
      return user;
    });
  }
}

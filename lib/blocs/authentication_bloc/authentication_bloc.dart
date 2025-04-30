import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;

  /// set the [userRepository] to the [AuthenticationBloc] to be used in implementing BLoC then accessing the default state
  AuthenticationBloc({required UserRepository myUserRepository})
    : userRepository = myUserRepository,

      /// [AuthenticationState.unknown() as initial state because the app doesnt know if the user is already logged in or not]
      super(AuthenticationState.unknown()) {
    /// listen to the [userRepository] stream and emit the [AuthenticationState]
    _userSubscription = userRepository.user.listen((userAuth) {
      /// triggers changes to the [AuthenticationState] when the user is logged in or out
      add(AuthenticationUserChanged(userAuth));
    });

    /// [AuthenticationUserChanged] methods below
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

  /// close the [userSubscription] stream when the [AuthenticationBloc] is closed
  /// to prevent memory leaks
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

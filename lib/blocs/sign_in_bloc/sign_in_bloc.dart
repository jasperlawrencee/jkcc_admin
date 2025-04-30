import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;
  SignInBloc({required UserRepository myUserRepository})
    : userRepository = myUserRepository,
      super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInLoading());
      try {
        await userRepository.signIn(event.email, event.password);
      } catch (e) {
        log(e.toString());
        emit(SignInFailure(error: e.toString()));
      }
    });
    on<SignOutRequired>((event, emit) async {
      await userRepository.signOut();
    });
  }
}

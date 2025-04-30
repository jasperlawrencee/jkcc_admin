import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  SignUpBloc({required UserRepository myUserRepository})
    : userRepository = myUserRepository,
      super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpLoading());
      try {
        final MyUser user = await userRepository.signUp(
          event.user,
          event.password,
        );
        await userRepository.setUserData(user);
        emit(SignUpSuccess(user: user));
      } catch (e) {
        log(e.toString());
        emit(SignUpFailure(error: e.toString()));
      }
    });
  }
}

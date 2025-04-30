import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'my_user_event.dart';
part 'my_user_state.dart';

class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  final UserRepository userRepository;

  MyUserBloc({required UserRepository myUserRepository})
    : userRepository = myUserRepository,
      super(MyUserState.loading()) {
    on<GetMyUser>((event, emit) async {
      try {
        MyUser user = await userRepository.getUserData(event.myUserId);
        emit(MyUserState.success(user));
      } catch (e) {
        log(e.toString());
        emit(MyUserState.failure());
      }
    });
  }
}

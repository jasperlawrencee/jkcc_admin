part of 'my_user_bloc.dart';

@immutable
abstract class MyUserEvent extends Equatable {
  const MyUserEvent();

  @override
  List<Object?> get props => [];
}

/// Event to get a user by ID
/// This event is triggered when the user ID is provided as a parameter
/// in order to fetch the user details from firebase.
class GetMyUser extends MyUserEvent {
  final String myUserId;

  const GetMyUser({required this.myUserId});

  @override
  List<Object?> get props => [myUserId];
}

import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? picture;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
  });

  // Empty user representing unauthenticated state
  static const MyUser empty = MyUser(id: '', name: '', email: '', picture: '');

  // Modify MyUser parameters
  MyUser copyWith({String? id, String? name, String? email, String? picture}) {
    return MyUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      picture: picture ?? this.picture,
    );
  }

  // getters for when determining user is empty or not

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  // transforms MyUser to MyUserEntity (JSON form to submit to firebase)
  MyUserEntity toEntity() {
    return MyUserEntity(id: id, name: name, email: email, picture: picture);
  }

  // takes JSON form (MyUserEntity) from firebase and transforms it to MyUser object
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      picture: entity.picture,
    );
  }

  @override
  List<Object?> get props => [id, name, email, picture];
}

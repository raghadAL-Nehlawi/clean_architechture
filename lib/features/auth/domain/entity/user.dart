import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({
    required this.id,
    this.phone,
    this.name,
    this.empty = false,
    required this.is_admin,
    this.image,
    required this.is_active
  });

  factory User.empty() => User.empty();

  final int? id;
  final String? phone;
  final String? name;
  final String? image;
  final int is_admin;
  final int is_active;
  final bool empty;

  @override
  List<Object?> get props => [
    id,
    phone,
    name,
  ];
}

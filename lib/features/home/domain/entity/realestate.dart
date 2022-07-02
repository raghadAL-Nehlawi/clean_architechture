import 'package:equatable/equatable.dart';

class Estate extends Equatable{
  String? id;
  String? price;
  String? name;
  String? location;
  String? roomNumber;
  String? bathroomNumber;
  List<String>? images;


  Estate({this.id, this.price, this.name, this.bathroomNumber ,this.images, this.location ,this.roomNumber});


  @override

  List<Object?> get props => [id];

}
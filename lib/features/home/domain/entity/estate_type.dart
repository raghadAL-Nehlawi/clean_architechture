import 'package:equatable/equatable.dart';

class EstateType extends Equatable{

  String? id;
  String? name;


  @override
  List<Object?> get props =>[id];

}
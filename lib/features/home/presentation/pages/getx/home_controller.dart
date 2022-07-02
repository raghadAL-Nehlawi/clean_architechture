import 'package:get/get.dart';
import '../../../domain/entity/realestate.dart';

class HomeController extends GetxController{
  List<Estate>estates = [
    Estate(price: "2000\$", name: "السيد للعقارات", bathroomNumber: '2 غرف ', roomNumber: '2 حمام',location: 'المزة Almazzeh'),
    Estate(price: "2000\$", name: "السيد للعقارات", bathroomNumber: ' 2 غرف ', roomNumber: ' حمام 2',location: 'المزة Almazzeh'),
    Estate(price: "2000\$", name: "السيد للعقارات", bathroomNumber: '2 غرف ', roomNumber: ' حمام 2',location: 'المزة Almazzeh'),

  ];
  @override
  onInit(){
    super.onInit();
  }

}
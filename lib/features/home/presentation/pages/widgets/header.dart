import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/widgets/app_text_field.dart';
import '../../../../../core/style/textStyles.dart';
import '../getx/home_controller.dart';

class HomePageHeader extends GetView<HomeController> {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Theme.of(context).primaryColor,),
                    Text("دمشق / المزة" , style: AppTextStyle.mediumSecondaryWithOpacityStyle,),
                    Icon(Icons.arrow_drop_down_rounded, color: Theme.of(context).primaryColor,),
                  ],

                ),
                Row(children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(999)
                    ),
                    child: SvgPicture.asset('assets/icons/notification.svg'),
                  ),
                  SizedBox(width: 10,height: 10,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: Container(
                        height: 40,
                        width: 40,
                        child:CachedNetworkImage(
                        imageUrl: "http://via.placeholder.com/350x150",
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress),
                         errorWidget: (context, url, error) => Icon(Icons.person, color: Colors.grey,),
                      ),
                    ),
                  ),



                ],),
              ],
            ),
          ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
           child:  Row(
           children: [
             AppTextField(
               'search'.tr,
               width: Get.width - 100,
               height: 45,
               style: AppTextStyle.mediumSecondaryWithOpacityStyle,
             prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
             ),
             SizedBox(width: 20,height:  10,),
             SvgPicture.asset("assets/icons/filter.svg")
                  ])
         )
        ],
      )

    );
  }
}

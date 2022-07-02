import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/style/textStyles.dart';
import '../../../domain/entity/realestate.dart';

class EstateWidget extends StatelessWidget {
  final Estate estate;
  EstateWidget({required this.estate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
        width: 275,
      height: 275,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF3F3F3),
      ),
      child: Column(
        children: [
          Container(
            height: 155,
            width: 153,
            child:CachedNetworkImage(
              imageUrl: "http://via.placeholder.com/350x150",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>Image.asset('assets/icons/image.png')
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(estate.name!, style: AppTextStyle.mediumPrimaryWithOpacityStyle,),
            Text(estate.price!, style: AppTextStyle.mediumSecondaryWithoutOpacityStyle,)
          ],),
          SizedBox(height: 8,width: 10,),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Theme.of(context).primaryColor,),
              Text(estate.location!, style: AppTextStyle.mediumSecondaryWithoutOpacityStyleWith500Bold,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/room.svg'),
                  SizedBox(width: 10,height: 10,),
                  Text(estate.roomNumber!, style: AppTextStyle.mediumSecondaryWithoutOpacityStyleWith500Bold,)
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/bathroom.svg'),
                  SizedBox(width: 10,height: 10,),
                  Text(estate.bathroomNumber!, style: AppTextStyle.mediumSecondaryWithoutOpacityStyleWith500Bold,)
                ],
              )
            ],
          )
        ],
      ),

      
    );
  }
}

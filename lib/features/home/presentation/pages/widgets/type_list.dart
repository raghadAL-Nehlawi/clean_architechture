import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/style/shadows.dart';
import '../../../../../core/style/textStyles.dart';
import '../../../domain/entity/estate_type.dart';

class TypeList extends StatelessWidget {
  final List<EstateType> types;
  final int selectedIndex;
  TypeList(this.types, this.selectedIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: ListView.builder(
          itemCount: types.length,
          itemBuilder: (_, index) => TypeWidget(types [index], selectedIndex == index)),
    );
  }
}

class TypeWidget extends StatelessWidget {
  final EstateType type;
  final bool isSelected;
  TypeWidget(this.type, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return isSelected?Container(
      alignment: AlignmentDirectional.center,
      margin:  EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      decoration: BoxDecoration(
          color:Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [getShadow(context)]
      ),
      child: Text(type.name!, style: AppTextStyle.largeSecondaryStyle(context),textAlign: TextAlign.center,),
    ): Container(
      alignment: AlignmentDirectional.center,
      margin:  EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      decoration: BoxDecoration(
          color:Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [getShadow(context)]
      ),
      child: Text(type.name!, style: AppTextStyle.largeWhiteStyle(context),textAlign: TextAlign.center,),
    );
  }
}


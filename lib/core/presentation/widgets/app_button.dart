import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends GetWidget {
  final String text;
  final Function onTap;
  final Widget? icon;
  final double height;
  final double? width;

  AppButton({required this.text, required this.onTap, this.icon, this.height = 55, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height + 32,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(icon != null) SizedBox(width: 10,height: 10,),
            Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: icon ?? SizedBox(),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          alignment: Alignment.center,
            primary: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../style/textStyles.dart';



class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 100,
              height: 50,
              child: Image.asset("assets/images/logo.png")),
          Text("Real state", style: AppTextStyle.largeSecondaryWithShadowStyle(context),)
        ],
      ),

    );
  }
}

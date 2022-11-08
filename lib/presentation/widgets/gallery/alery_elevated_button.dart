import 'package:flutter/material.dart';
import '../../../core/style/app_color.dart';

import '../../../core/utils/screen_config.dart';

class AlertElevatedButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final void Function()? onPressed;

  final double iconSize;
  const AlertElevatedButton(
      {super.key,
      required this.text,
      required this.imagePath,
      this.onPressed,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: SizeConfig.screenWidth * 0.54,
      height: SizeConfig.screenHeight * 0.09,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColor.buttonColor,
            foregroundColor: const Color(0xff4A4A4A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            textStyle:
                const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
        icon: Image.asset(
          imagePath,
          width: 30,
          height: 30,
        ),
        label: Text(text),
      ),
    );
  }
}

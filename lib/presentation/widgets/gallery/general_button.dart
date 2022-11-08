import 'package:flutter/material.dart';
import '../../../core/utils/app_size.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/style/app_color.dart';

class GeneralButtonComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final String image;
  const GeneralButtonComponent(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: height * 0.06,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width * 0.1,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Image.asset(image)),
                  ),
                  Text(
                    text,
                    style: GoogleFonts.balooThambi2(
                      fontSize: 22,
                      height: 0.9,
                      fontWeight: FontWeight.w500,
                      color: AppColor.gray03,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

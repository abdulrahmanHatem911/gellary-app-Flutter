import 'package:flutter/material.dart';
import 'package:gellary_app/core/utils/app_size.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/style/app_color.dart';

class SelectImage extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  const SelectImage(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.07,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * 0.1,
              height: height * 0.06,
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            AppSize.sh_20,
            Text(
              title,
              style: GoogleFonts.balooThambi2(
                fontSize: 24,
                height: 0.9,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
            AppSize.sh_20,
          ],
        ),
      ),
    );
  }
}

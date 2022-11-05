import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gellary_app/core/utils/app_string.dart';

import '../../domain/entity/gallery_data.dart';

class BuildGradViewComponent extends StatelessWidget {
  final List galleryData;
  const BuildGradViewComponent({super.key, required this.galleryData});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: List.generate(galleryData.length, (index) {
        return Container(
          width: width * 0.4,
          height: height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(galleryData[index].toString() == null ||
                      galleryData[index].toString().isEmpty
                  ? "${AppString.image}"
                  : galleryData[index].toString()),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}

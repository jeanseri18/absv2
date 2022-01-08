import 'package:abidjanstreaming/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
class StandardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          dataWidget(Strings.monthlyPrice, 'USD 356.99'),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.heightSize,
              bottom: Dimensions.heightSize,
            ),
            child: Divider(color: Colors.grey,),
          ),
          dataWidget(Strings.multipleDevices, 'YES'),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.heightSize,
              bottom: Dimensions.heightSize,
            ),
            child: Divider(color: Colors.grey,),
          ),
          dataWidget(Strings.videoQuality, 'Better'),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.heightSize,
              bottom: Dimensions.heightSize,
            ),
            child: Divider(color: Colors.grey,),
          ),
          dataWidget(Strings.resolution, '1080p'),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.heightSize,
              bottom: Dimensions.heightSize,
            ),
            child: Divider(color: Colors.grey,),
          ),
          dataWidget(Strings.screenYouCanWatch, '10'),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimensions.heightSize,
              bottom: Dimensions.heightSize,
            ),
            child: Divider(color: Colors.grey,),
          ),
        ],
      ),
    );
  }
  dataWidget(String name, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

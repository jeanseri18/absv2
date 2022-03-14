import 'package:abidjanstreaming/utils/colors.dart';
import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BackWidget extends StatefulWidget {
  final String name;
  final String image;

  const BackWidget({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  _BackWidgetState createState() => _BackWidgetState();
}

class _BackWidgetState extends State<BackWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.radius * 2),
            bottomRight: Radius.circular(Dimensions.radius * 2)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.marginSize, right: Dimensions.marginSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Icon(
                Icons.arrow_back_outlined,
                color: CustomColor.accentColor,
                size: 20,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            /*   SizedBox(
              width: Dimensions.widthSize,
            ),*/
            Spacer(),
            Text(
              widget.name.toUpperCase(),
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Image.asset(
              widget.image,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}

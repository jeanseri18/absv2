import 'package:abidjanstreaming/utils/dimensions.dart';
import 'package:abidjanstreaming/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddQuantityWidget extends StatefulWidget {
  @override
  _AddQuantityWidgetState createState() => _AddQuantityWidgetState();
}

class _AddQuantityWidgetState extends State<AddQuantityWidget> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.5))),
            child: Center(
              child: Icon(Icons.remove),
            ),
          ),
          onTap: () {
            setState(() {
              if (qty > 1) {
                qty--;
              } else {
                Fluttertoast.showToast(
                    msg: Strings.quantityCantZero,
                    backgroundColor: Colors.red,
                    textColor: Colors.white);
              }
            });
          },
        ),
        SizedBox(
          width: Dimensions.widthSize * 0.5,
        ),
        Text(
          qty.toString(),
          style: TextStyle(
              color: Colors.black, fontSize: Dimensions.extraLargeTextSize),
        ),
        SizedBox(
          width: Dimensions.widthSize * 0.5,
        ),
        GestureDetector(
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.5))),
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
          onTap: () {
            setState(() {
              if (qty < 10) {
                qty++;
              } else {
                Fluttertoast.showToast(
                    msg: Strings.quantityCantMax,
                    backgroundColor: Colors.red,
                    textColor: Colors.white);
              }
            });
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';

Widget myAppBarIcon({data}){
return Container(
  width: 35,
  height: 35,
  margin: EdgeInsets.only(left: 7.0),
  child: Stack(
    children: [
      Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
        size: 35,
      ),
      Container(
        width: 35,
        height: 35,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 1, left: 1),
        child: Container(
          width: 17,
          height: 17,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsSys.yellow,
              border: Border.all(color: ColorsSys.yellow, width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Text(
                data.toString(),
                style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
);

}
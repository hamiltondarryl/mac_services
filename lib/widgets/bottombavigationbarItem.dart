import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

BottomNavigationBarItem customBottomNavigationBarItem({title, icon, curentIndex, index}){
  return BottomNavigationBarItem(
            icon: Icon(icon, size: curentIndex == index ? 30 :25.0, color: curentIndex != index ? Colors.grey : null ,),
            // ignore: deprecated_member_use
            title: Text(title)
      );
}
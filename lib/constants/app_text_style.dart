import 'package:flutter/material.dart';

class AppTextStyle {
  static const black16px = TextStyle(color: Colors.black, fontSize: 16);
  static const black14pxW500 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final black13px7OP = TextStyle(
    color: Colors.black.withOpacity(.7),
    fontSize: 13,
  );
  static const white20pxW400 =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400);
  static const white14pxW400 =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400);
  static const white12pxW400 =
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400);
  static final blue800Fs14pxW500 = TextStyle(
    color: Colors.blue.shade800,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

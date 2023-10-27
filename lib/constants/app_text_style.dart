import 'package:flutter/material.dart';

class AppTextStyle {
  // Black
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

  //Blue

  static final blue800Fs14pxW500 = TextStyle(
    color: Colors.blue.shade800,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  // White

  static const white12pxW400 =
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400);

  static final white12w400op05 = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const white14pxW400 =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400);
  static const white14pxW300 =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300);
  static const white14pxW600 =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);

  static const white15pxW600 =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15);

  static final white15w400op05 = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );

  static const white14Ellipsis = TextStyle(
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
    fontSize: 14,
  );
  static const white18pxW600 =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18);

  static const white20pxW400 =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400);

  static const white25px = TextStyle(color: Colors.white, fontSize: 25);

  static const white25pxW800 = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.w800,
  );

  static const white32px = TextStyle(color: Colors.white, fontSize: 32);
  static const white32pxBillabong =
      TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'Billabong');
}

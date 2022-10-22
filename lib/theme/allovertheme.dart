import 'dart:ui';

import 'package:flutter/cupertino.dart';

// cardBackGround :
Color cardBackGround(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;

  var isDark = brightness == Brightness.dark;

  return isDark ?
      const Color(0xff444444)
      : const Color(0xfff6f6f6);
}

//containerBackGround :
Color containerBackGround(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;

  var isDark = brightness == Brightness.dark;

  return isDark ?
  const Color(0xff2c2c2c) :
  const Color(0xffdbdbdb);
}

/// cardBorder
Color cardBorder(BuildContext context) {
  var brightness = MediaQuery.of(context).platformBrightness;

  var isDark = brightness == Brightness.dark;

  return isDark ?
  const Color(0xff808080) :
  const Color(0xffc5c5c5);
}

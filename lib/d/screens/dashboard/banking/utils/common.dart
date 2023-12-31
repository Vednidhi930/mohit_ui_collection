import 'package:flutter/cupertino.dart';

import 'colors.dart';

Gradient primaryLinearGradient() {
  return LinearGradient(
    colors: [primaryBankingColor2, primaryBankingColor1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

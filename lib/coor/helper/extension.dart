import 'package:flutter/material.dart';

import '../theme/app_sizes.dart';

extension SchemeExtension on BuildContext{
  ColorScheme  get scheme => Theme.of(this).colorScheme;
}


extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}



extension AppSizeExtension on BuildContext {
  double get h4 => MediaQuery.of(this).size.height * AppSizes.h4;
  double get h8 => MediaQuery.of(this).size.height * AppSizes.h8;
  double get h12 => MediaQuery.of(this).size.height * AppSizes.h12;
  double get h16 => MediaQuery.of(this).size.height * AppSizes.h16;
  double get h20 => MediaQuery.of(this).size.height * AppSizes.h20; 
  double get h24 => MediaQuery.of(this).size.height * AppSizes.h24; 
  double get h28 => MediaQuery.of(this).size.height * AppSizes.h28; 
  double get h32 => MediaQuery.of(this).size.height * AppSizes.h32; 
  double get h36 => MediaQuery.of(this).size.height * AppSizes.h36; 

    


  double get w4 => MediaQuery.of(this).size.width * AppSizes.w4;
  double get w8 => MediaQuery.of(this).size.width * AppSizes.w8;
  double get w12 => MediaQuery.of(this).size.width * AppSizes.w12;
  double get w16 => MediaQuery.of(this).size.width * AppSizes.w16;
  double get w20 => MediaQuery.of(this).size.width * AppSizes.w20;
  double get w24 => MediaQuery.of(this).size.width * AppSizes.w24;
  double get w28 => MediaQuery.of(this).size.width * AppSizes.w28;
  double get w32 => MediaQuery.of(this).size.width * AppSizes.w32;
  double get w36 => MediaQuery.of(this).size.width * AppSizes.w36;

}
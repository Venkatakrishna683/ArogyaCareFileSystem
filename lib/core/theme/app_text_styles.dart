import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.navy,
  );
  static const TextStyle subHeading = TextStyle(
    fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.navy,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16, color: AppColors.navy,
  );
  static const TextStyle small = TextStyle(
    fontSize: 14, color: Colors.grey,
  );
}
import 'package:flutter/material.dart';

class StepItem {
  final String title;
  final IconData icon;
   bool isActive;


  StepItem({
    required this.title,
    required this.icon,
    this.isActive = false,
  });
}
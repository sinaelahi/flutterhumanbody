import 'dart:ui';
import 'package:sahand/interviewexam/humanbody/humanbody.dart';

//  BodyText class
class BodyPartLabel {
  final String text;
  final LabelPosition position;
  
  const BodyPartLabel({
    required this.text,
    required this.position,
  });
}
class LabelPosition {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  const LabelPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });
}
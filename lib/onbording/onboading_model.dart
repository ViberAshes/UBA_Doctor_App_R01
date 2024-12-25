import 'dart:ui';

class OnbordingModel {
  final String image;
  final String title;
  final String subtitle;
  final String subtitletow;
  final String counterText;
  final Color bgcolor;
  final int? size;

  OnbordingModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.subtitletow,
    required this.counterText,
    required this.bgcolor,
    this.size,
  });
}

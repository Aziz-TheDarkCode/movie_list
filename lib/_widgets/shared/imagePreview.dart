import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required String image,
  }) : _image = image;

  final String _image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        _image,
        fit: BoxFit.cover,
        height: 130,
        width: 130,
      ),
    );
  }
}

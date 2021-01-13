import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PreviewScreen extends StatelessWidget {
  final String url;

  PreviewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
          imageProvider: NetworkImage(url),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';

class PreviewImage extends StatelessWidget {
  String? url;

  PreviewImage({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageFade(
      image: url == null
          ? null
          : NetworkImage(url!), // slow-ish fade for loaded images:
      duration: const Duration(milliseconds: 500),
      // if the image is loaded synchronously (ex. from memory), fade in faster:
      syncDuration: const Duration(milliseconds: 150),
      // supports most properties of Image:
      alignment: Alignment.center,
      fit: BoxFit.cover,

      // shown behind everything:
      placeholder: Image.asset('assets/placeholder/music-placeholder.png'),

      // shows progress while loading an image:
      // loadingBuilder: (context, progress, chunkEvent) =>
      //     Center(child: CircularProgressIndicator(value: progress)),

      // displayed when an error occurs:
      errorBuilder: (context, error) => Container(
        color: const Color(0xFF6F6D6A),
        alignment: Alignment.center,
        child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
      ),
    );
  }
}

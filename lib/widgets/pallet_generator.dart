import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class Pallet extends StatefulWidget {
  ImageProvider? image;

  Pallet({Key? key, this.image}) : super(key: key);

  @override
  State<Pallet> createState() => _PalletState();
}

class _PalletState extends State<Pallet> {
  Color color = Colors.black;

  @override
  void initState() {
    if (widget.image == null) {
      color = Colors.black;
    } else {
      getImagePalette(widget.image!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color, Colors.black])));
  }

  // Calculate dominant color from ImageProvider
  Future getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    setState(() {
      color = paletteGenerator.dominantColor!.color.withOpacity(0.5);
    });
  }
}

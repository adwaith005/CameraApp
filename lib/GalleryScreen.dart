import 'dart:io';

import 'package:camera_app2/ImagePreview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryScreen extends StatefulWidget {
  final List<File> images;

  GalleryScreen({Key? key, required this.images}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            title: Text('GALLERY'),
          ),
          body: Center(
            child: Text('NO IMAGES IN GALLERY'),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('GALLERY'),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: widget.images.map((image) {
            return InkWell(
              onLongPress: () async {
                print('long press');

                final _sheredpres = await SharedPreferences.getInstance();
                setState(() {
                  List<String>? prefimage = _sheredpres.getStringList('image');
                  print(prefimage);
                });
              },
              onTap: () async {
                widget.images.forEach((element) async {
                  if (element == image) {
                    var clickedimage =
                        widget.images[widget.images.indexOf(element)];
                    print(clickedimage);
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return ImagePreview(clickedimage: clickedimage);
                    }));
                  }
                });
              },
              child: Image.file(image, fit: BoxFit.cover),
            );
          }).toList(),
        ),
      );
    }
  }
}

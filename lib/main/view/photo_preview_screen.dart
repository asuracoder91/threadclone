import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thread/main/widgets/write_page.dart';

class PhotoPreviewScreen extends ConsumerStatefulWidget {
  const PhotoPreviewScreen({
    super.key,
    required this.photo,
    required this.isPicked,
  });

  final XFile photo;
  final bool isPicked;

  @override
  PhotoPreviewScreenState createState() => PhotoPreviewScreenState();
}

class PhotoPreviewScreenState extends ConsumerState<PhotoPreviewScreen> {
  void _onUploadPresed() {
    Navigator.of(context).pop(widget.photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Preview Image'),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _onUploadPresed,
              icon: const FaIcon(FontAwesomeIcons.cloudArrowUp),
            )
        ],
      ),
      body: Center(
        child: Image.file(File(widget.photo.path)),
      ),
    );
  }
}

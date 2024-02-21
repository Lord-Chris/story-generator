import 'package:flutter/material.dart';

class ImageSourceDialog extends StatelessWidget {
  const ImageSourceDialog({super.key});

  Future<T?> show<T>(BuildContext context) =>
      showDialog(context: context, builder: (context) => this);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              onTap: () => Navigator.pop(context, false),
              leading: const Icon(Icons.camera),
              title: const Text('Take Photo'),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              onTap: () => Navigator.pop(context, true),
              leading: const Icon(Icons.photo),
              title: const Text('Choose photo from gallery'),
            ),
          ],
        ),
      ),
    );
  }
}

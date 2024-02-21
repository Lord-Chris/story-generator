import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:story_generator/models/story_params.dart';

import '../shared/_shared.dart';

class StoryView extends StatefulWidget {
  final File image;
  final StoryParams storyParams;

  const StoryView({
    Key? key,
    required this.image,
    required this.storyParams,
  }) : super(key: key);

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Gen', style: AppTextStyles.semiBold24),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.file(widget.image, fit: BoxFit.cover),
          Padding(
            padding: REdgeInsets.all(16),
            child: Text(
              'Happy now?',
              style: AppTextStyles.regular14,
            ),
          ),
        ],
      ),
    );
  }
}

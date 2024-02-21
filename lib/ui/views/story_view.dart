import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_generator/models/story_params.dart';

import '../../services/ai_service/ai_service.dart';
import '../../services/ai_service/i_ai_service.dart';
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
  final IAIService _aiService = AIService();
  String story = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Here's your ${widget.storyParams.genre} story",
          style: AppTextStyles.semiBold18,
        ),
        centerTitle: true,
      ),
      body: ScrollableColumn(
        children: [
          Image.file(widget.image, fit: BoxFit.cover),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              padding: REdgeInsets.all(16),
              child: FutureBuilder<String>(
                initialData: story,
                future: _aiService.fetchStoryDetail(widget.storyParams),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: AppLoader(color: AppColors.bidPry400),
                    );
                  }
                  if (snapshot.data == null) {
                    return Column(
                      children: [
                        const Text('Try again'),
                        Spacing.vertRegular(),
                        AppButton(
                          label: 'Refresh',
                          onPressed: () {
                            setState(() {});
                          },
                        )
                      ],
                    );
                  }
                  story += snapshot.data ?? '';

                  return DefaultTextStyle(
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.black,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(snapshot.data ?? story),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

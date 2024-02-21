import 'dart:async';
import 'dart:io';

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
  late StreamSubscription<String> _storySubscription;
  final _storyController = StreamController<String>();
  String story = '';

  @override
  void initState() {
    super.initState();
    _storySubscription =
        _aiService.streamStoryDetail(widget.storyParams).listen((event) {
      print(event);
      _storyController.add(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _storyController.close();
    _storySubscription.cancel();
  }

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
            child: StreamBuilder<String>(
              stream: _storyController.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: AppLoader());
                }
                if (snapshot.data == null) {
                  return Column(
                    children: [
                      const Text('Try again'),
                      Spacing.vertRegular(),
                      AppButton(
                        label: 'Refresh',
                        onPressed: () {
                          _storySubscription.cancel();
                          story = '';
                          _storySubscription = _aiService
                              .streamStoryDetail(widget.storyParams)
                              .listen((event) => _storyController.add(event));
                        },
                      )
                    ],
                  );
                }
                story += snapshot.data ?? '';

                return Text(
                  story,
                  style: AppTextStyles.regular14,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

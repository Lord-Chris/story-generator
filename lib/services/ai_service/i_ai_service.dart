import 'dart:io';

import 'package:story_generator/models/story_params.dart';

abstract class IAIService {
  Future<List<String>> getItemsFromImage(File image);

  Stream<String> streamStoryDetail(StoryParams storyParams);
}

import 'dart:convert';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';
import 'package:story_generator/models/item_data.dart';
import 'package:story_generator/services/ai_service/i_ai_service.dart';
import 'package:story_generator/ui/shared/constants/env_data.dart';

import '../../models/story_params.dart';

class AIService extends IAIService {
  final _log = Logger();
  final imageModel = GenerativeModel(
    model: 'gemini-pro-vision',
    apiKey: EnvData.apiKey,
  );
  final textModel = GenerativeModel(
    model: 'gemini-pro',
    apiKey: EnvData.apiKey,
  );

  static const listPrompt =
      '''In this image, identify and label all visible objects with a confidence score above 70%. Return the results as a JSON object with the following structure:'''
      '''{
  "data": [
    {
      "name": "object_name",
      "description": "brief description"
    },
    ... (other objects)
  ]
} ''';
  @override
  Future<List<String>> getItemsFromImage(File image) async {
    final imageBytes = await image.readAsBytes();
    final content = [
      Content.multi([TextPart(listPrompt), DataPart('image/png', imageBytes)])
    ];

    final res = await imageModel.generateContent(content);
    _log.d(jsonDecode(res.text ?? ""));
    final parsedRes = (jsonDecode(res.text ?? '') as Map<String, dynamic>);
    final data =
        (parsedRes["data"] as List).map((e) => ItemData.fromMap(e)).toList();

    return data.map((e) => e.value).toList();
  }

  @override
  Stream<String> streamStoryDetail(StoryParams storyParams) {
    String prompt =
        'Create a bedtime story from items in this list: ${storyParams.items}.';
    prompt += 'The story should be a ${storyParams.genre} story.';
    prompt += 'The story should be ${storyParams.parsedLength} long.';
    // ' The story should be in a Nigerian setting and should be in Pidgin english';
    final content = [Content.text(prompt)];
    final response = textModel.generateContentStream(content);
    return response.map((event) => event.text ?? 'No story generated.');
  }
}

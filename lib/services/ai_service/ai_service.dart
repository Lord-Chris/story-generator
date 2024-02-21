import 'dart:convert';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';
import 'package:story_generator/services/ai_service/i_ai_service.dart';
import 'package:story_generator/ui/shared/constants/env_data.dart';

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

  static const listPrompt = 'List the items in a imaage inside a Dart list';
  @override
  Future<List<String>> getItemsFromImage(File image) async {
    final imageBytes = await image.readAsBytes();
    final content = [
      Content.multi([TextPart(listPrompt), DataPart('image/png', imageBytes)])
    ];

    final res = await imageModel.generateContent(content);
    _log.d(res);
    return (jsonDecode(jsonEncode(res)) as List).cast<String>();
  }
}

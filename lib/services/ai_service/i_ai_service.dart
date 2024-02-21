import 'dart:io';

abstract class IAIService {
  Future<List<String>> getItemsFromImage(File image);
}

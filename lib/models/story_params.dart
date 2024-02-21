class StoryParams {
  final List<String> items;
  final String genre;
  final String length;
  final String language;

  const StoryParams({
    required this.items,
    required this.genre,
    required this.length,
    required this.language,
  });

  String get parsedLength {
    switch (length) {
      case 'short':
        return 'at least 3 paragraphs';
      case 'medium':
        return 'at least 5 paragraphs';
      case 'long':
        return 'at least 9 paragraphs';
      default:
        return 'at least 3 paragraphs';
    }
  }
}

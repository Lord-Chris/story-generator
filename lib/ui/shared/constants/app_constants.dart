class AppConstants {
  AppConstants._();
  static const appName = 'Story Gen';
  static const mockImage =
      'https://www.bing.com/th?id=OIP.Sa9ZfKEPzreh38i8xrwQJgHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2';
  static const mockTestsImage =
      'https://valhala-stg.s3.eu-west-2.amazonaws.com/avatar/woman-graduating-with-certificate-avatar-character-vector-25010708.jpg';

  static const List<String> genres = [
    "Children bedtime story",
    "Adventure",
    "Mystery",
    "Romance",
    "Science fiction",
    "Fantasy",
    "Thriller",
    "Historical fiction",
    "Humor",
    "Young adult",
  ];

  static const List<String> storyLength = ['Long', 'Medium', 'Short'];
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIEndpoint {
  static String get baseUrl => dotenv.env['API_URL'].toString();
}
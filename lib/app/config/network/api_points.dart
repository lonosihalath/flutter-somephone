import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiVersion = "/api/${dotenv.env['API_VERSION'].toString()}";
String apiVersions = "/api/${dotenv.env['API_VERSIONS'].toString()}";

class APIPoint {
  static String login = "$apiVersion/login";

}

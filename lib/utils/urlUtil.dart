import '../constant.dart';

class UrlUtil {
  static String get _baseUrl => "https://newsapi.org/v2/";

  static String getEveryThinkUrl(String topic) {
    var data = "$_baseUrl/everything?q=$topic&apiKey=$API_KEY";

    print(data);

    return data ;
  }
}

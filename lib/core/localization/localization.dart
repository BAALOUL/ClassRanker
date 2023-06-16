import 'package:get/get.dart';

class MyLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": " اهلا ",
          "Choose language": "اختر اللغة",
        },
        "en": {
          "1": "Hello",
          "Choose language": "Choose language",
        },
        "fr": {
          "1": "Bonjour",
          "Choose language": "Choose language",
        }
      };
}

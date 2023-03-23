import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_chat_gpt/utils/constant.dart';

Future<String> generateResponse(String prompt) async {
  var apiKey = AppConstant.myKey;

  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      "temperature": 0.7,
      "max_tokens": 256,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    }),
  );

  Map<String, dynamic> decodedResponse = jsonDecode(response.body);

  if (decodedResponse.containsKey("error")) {
    return "Your quota limit expired";
  }

  return decodedResponse["choices"][0]["text"].toString();
}

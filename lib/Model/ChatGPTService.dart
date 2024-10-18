import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTService {
  // final String apiKey = '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'; // Ganti dengan API key dari OpenAI
  final String apiKey = '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'; // Ganti dengan API key dari OpenAI

  Future<String> sendMessage(String message) async {
    const apiUrl = 'https://api.openai.com/v1/chat/completions';

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo-0125",
          "messages": [
            {"role": "system",
              "content": "You are a helpful assistant."
            },
            {"role": "user",
              "content": message
            }
          ],
          "max_tokens": 100
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var reply = data['choices'][0]['message']['content'];
        return reply.trim();
      } else {
        print('Failed to connect: ${response.body}');
        throw Exception('Failed to connect with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return 'Error: $e';
    }
  }
}

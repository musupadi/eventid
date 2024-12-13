import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../Model/Ascendant.dart';
import 'Server.dart';
import 'package:http/http.dart' as http;
final String apiKey = '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'; // Ganti dengan API Key dari OpenAI


Future<List> HotelNLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APIHotelNLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();

    if (jsonDecode(respStr)['status'].toString() == "true") {
      try {
        return jsonDecode(respStr)['data'];
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return [];
  }
}
Future<Map<String, dynamic>> NLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APINLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();
    final decodedResponse = jsonDecode(respStr);

    if (decodedResponse['status'] == true) {
      return decodedResponse;
    } else {
      return {}; // Atur default jika tidak ada data
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return {}; // Kembalikan map kosong jika terjadi error
  }
}

Future<List> TransportationNLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APITransportationNLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();

    if (jsonDecode(respStr)['status'].toString() == "true") {
      try {
        return jsonDecode(respStr)['data'];
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return [];
  }
}
Future<List> DestinationNLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APIDestinationNLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();
    print('Data URL: '+respStr.toString());
    if (jsonDecode(respStr)['status'].toString() == "true") {
      try {
        return jsonDecode(respStr)['data'];
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return [];
  }
}
Future<List> MerchandiseNLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APIMerchandiseNLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();

    if (jsonDecode(respStr)['status'].toString() == "true") {
      try {
        return jsonDecode(respStr)['data'];
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return [];
  }
}
Future<List> ProductionNLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APIProductionNLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();

    if (jsonDecode(respStr)['status'].toString() == "true") {
      try {
        return jsonDecode(respStr)['data'];
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return [];
  }
}
Future<List> ActivityNLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APIActivityNLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();

    if (jsonDecode(respStr)['status'].toString() == "true") {
      try {
        return jsonDecode(respStr)['data'];
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return [];
  }
}
Future<List> TournamentNLP(BuildContext context, String nlp) async {
  try {
    final url = Uri.parse(APIBaseURL() + APITournamentNLP());
    final request = http.MultipartRequest('POST', url);

    // Debug URL to check if it's correct
    print('Request URL: $url');

    request.fields['nlp'] = nlp;

    // Menambahkan timeout pada pengiriman request
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout
      onTimeout: () {
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );

    final respStr = await response.stream.bytesToString();

    if (jsonDecode(respStr)['status'].toString() == "true") {
      try {
        return jsonDecode(respStr)['data'];
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    if (e is TimeoutException) {
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else if (e is SocketException) {
      // Menangani jika terjadi masalah koneksi
      Message('Connection Refused', 'Failed to connect to the server. Please check your connection.', context);
    } else {
      Message('Request Failed', e.toString(), context);
    }
    return [];
  }
}
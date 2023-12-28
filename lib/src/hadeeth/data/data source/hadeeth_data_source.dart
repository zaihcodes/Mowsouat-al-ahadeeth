import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hadeeth/core/error/exceptions.dart';
import 'package:hadeeth/src/hadeeth/data/models/hadeeth_model.dart';
import 'package:http/http.dart' as http;

abstract class HadeethDataSource {
  Future<HadeethModel> getHadeeth(
      {required String hadeethId, required String lang});
}

const baseUrl = 'https://hadeethenc.com';

class HadeethDataSourceImpl implements HadeethDataSource {
  final http.Client client;
  const HadeethDataSourceImpl({required this.client});
  @override
  Future<HadeethModel> getHadeeth(
      {required String hadeethId, required String lang}) async {
    final url =
        Uri.parse('$baseUrl/api/v1/hadeeths/one/?language=$lang&id=$hadeethId');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      // debugPrint('hadeeth response.body: ${response.body}');

      final data = json.decode(response.body);

      return HadeethModel.fromJson(data);
    } else {
      throw ServerException('Failed to load Hadeeth: ${response.reasonPhrase}');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hadeeth/core/error/exceptions.dart';
import 'package:hadeeth/src/category/data/models/category_detail_model.dart';
import 'package:hadeeth/src/category/data/models/category_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories({required String lang});
  Future<CategoryDetailModel> getCategoryDetail(
      {required String lang,
      required String categoryId,
      required String page,
      required String perPage});
}

const baseUrl = 'https://hadeethenc.com';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  const CategoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getAllCategories({required String lang}) async {
    final url = Uri.parse('$baseUrl/api/v1/categories/list/?language=$lang');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      debugPrint('response.body: ${response.body}');
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw ServerException(
          'Failed to load categories: ${response.reasonPhrase}');
    }

    // return staticBody.map((json) => CategoryModel.fromJson(json)).toList();
  }

  @override
  Future<CategoryDetailModel> getCategoryDetail(
      {required String lang,
      required String categoryId,
      required String page,
      required String perPage}) async {
    final url = Uri.parse(
        '$baseUrl/api/v1/hadeeths/list/?language=$lang&category_id=$categoryId&page=$page&per_page=$perPage');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      CategoryDetailModel categoryDetail = CategoryDetailModel.fromJson(data);
      return categoryDetail;
    } else {
      throw ServerException(
          'Failed to load category Hadeeths: ${response.reasonPhrase}');
    }
  }
}

const List<Map<String, dynamic>> staticBody = [
  {
    "id": "1",
    "title": "القرآن الكريم وعلومه",
    "hadeeths_count": "197",
    "parent_id": null
  },
  {
    "id": "2",
    "title": "الحديث وعلومه",
    "hadeeths_count": "15",
    "parent_id": null
  },
  {"id": "3", "title": "العقيدة", "hadeeths_count": "711", "parent_id": null},
  {
    "id": "4",
    "title": "الفقه وأصوله",
    "hadeeths_count": "1807",
    "parent_id": null
  },
  {
    "id": "5",
    "title": "الفضائل والآداب",
    "hadeeths_count": "1008",
    "parent_id": null
  },
  {
    "id": "6",
    "title": "الدعوة والحسبة",
    "hadeeths_count": "137",
    "parent_id": null
  },
  {
    "id": "7",
    "title": "السيرة والتاريخ",
    "hadeeths_count": "353",
    "parent_id": null
  }
];

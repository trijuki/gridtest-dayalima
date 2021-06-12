import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gridtest/model/list_detail.dart';
import '../model/list.dart';
import '../model/list_detail.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url =
      'https://s3-ap-southeast-1.amazonaws.com/static.klob.id/tmp_files';

  static List<KlobList> parseList(List responseBody) {
    List<KlobList> klobList =
        responseBody.map((model) => KlobList.fromJson(model)).toList();
    return klobList;
  }

  static List<KlobDetailList> parseDetailList(List responseBody) {
    List<KlobDetailList> klobList =
        responseBody.map((model) => KlobDetailList.fromJson(model)).toList();
    return klobList;
  }

  static Future<List<KlobList>> fetchList() async {
    final response = await http.get(Uri.parse("${url}/index.json"));
    if (response.statusCode == 200) {
      List list = json.decode(response.body)["data"];
      return compute(parseList, list);
    } else {
      throw Exception('can\'t get list');
    }
  }

  static Future<List<KlobDetailList>> fetchDetail(String listData) async {
    final response = await http.get(Uri.parse("${url}/${listData}"));
    if (response.statusCode == 200) {
      List list = json.decode(response.body)["data"];
      return compute(parseDetailList, list);
    } else {
      throw Exception('can\'t get list');
    }
  }
}

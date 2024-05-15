// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app_bloc/app_constants/app_url.dart';
import 'package:travel_app_bloc/model/data_model.dart';

class DataServices {
  Future<List<DataModel>> getInfo() async {
    var apiUrl = AppUrl().url;
    http.Response res = await http.get(Uri.parse(apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return <DataModel>[];
    }
  }
}

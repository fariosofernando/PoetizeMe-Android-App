import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poetizeme/api/configs_api.dart';
import 'package:poetizeme/utils/result.dart';

import '../models/poetry_model.dart';

class Poetry {
  final APIConfigs configs;

  Poetry(this.configs);

  Future<Result<List<PoetryModel>>> getAll() async {
    List<PoetryModel> poetrys = [];

    final response = await http.get(Uri.parse(configs.poetrys));
    List data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var poetry in data) {
        poetrys.add(PoetryModel.fromJson(poetry));
      }

      return Result.success(poetrys);
    } else {
      return Result.failure(data.toString());
    }
  }
}

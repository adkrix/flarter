import 'package:dio/dio.dart';
import 'package:flarter/models/models.dart';
import 'package:flutter/material.dart';

import '../abstract_data_repo.dart';

const baseUrl = 'https://nominatim.openstreetmap.org/search';

final dio = Dio();

class OsmRepo implements AbstractDataRepo {
  @override
  Future<List<Osm>> getItems([String? q = 'Columb street']) async {
    try {
      final response = await dio.get<List<dynamic>>(
        baseUrl,
        queryParameters: {'format': 'json', 'q': '$q'},
        options: Options(
          headers: {'User-Agent': 'MyCustomApp/0.1.0 (iOS; iPhone)'},
        ),
      );
      debugPrint('${response.requestOptions.uri}');
      debugPrint('${response.statusCode}');

      if (response.statusCode == 200) {
        List<Osm> unis = (response.data ?? [])
            .map((item) => Osm.fromJson(item as Map<String, dynamic>))
            .toList();
        return unis;
      } else {
        throw Exception('Load data error');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Request error');
    }
  }
}

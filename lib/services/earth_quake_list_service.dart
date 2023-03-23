import 'dart:convert';

import 'package:deprem_bilgi/models/earth_quake_list_model.dart';
import 'package:http/http.dart' as http;

class EarthQuakeListService {
  Future<List<Result>> getEarthQuake() async {
    List<Result> myModels;
    var url = Uri.https('api.orhanaydogdu.com.tr', '/deprem/live.php');
    var response = await http.get(url);
    print(jsonDecode(response.body)['result']);

    List<dynamic> body = jsonDecode(response.body)['result'];
    myModels = body.map((dynamic item) => Result.fromJson(item)).toList();
    print(myModels[0]);
    return myModels;
  }
}

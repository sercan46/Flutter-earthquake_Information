import 'dart:convert';

import 'package:deprem_bilgi/models/earth_quake_list_model.dart';
import 'package:http/http.dart' as http;

class EarthQuakeListService {
  Future<List<EarthQuakeListModel>> getEarthQuake() async {
    List<EarthQuakeListModel> myModels;
    var url = Uri.https('api.orhanaydogdu.com.tr', '/deprem/live.php');
    var response = await http.get(url);
    List<dynamic> body = jsonDecode(response.body)['result'];
    myModels =
        body.map((dynamic item) => EarthQuakeListModel.fromJson(item)).toList();
    return myModels;
  }
}

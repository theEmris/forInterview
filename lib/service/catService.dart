import 'package:dio/dio.dart';
import 'package:interview_app/model/catModel.dart';

class CatService extends Object {
  static Future<List<CatsModel>> getCats() async {
    Response res = await Dio().get("https://cat-fact.herokuapp.com/facts");

    return (res.data as List).map((e) => CatsModel.fromJson(e)).toList();
  }
}

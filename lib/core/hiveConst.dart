import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview_app/model/hiveModel.dart';

class Boxes {
  static Box<MyModel> getCats() => Hive.box<MyModel>('StoredData');
  
  }
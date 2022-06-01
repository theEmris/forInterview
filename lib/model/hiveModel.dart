
import 'package:hive/hive.dart';
part 'hiveModel.g.dart';
@HiveType(typeId: 0)
class MyModel {
  @HiveField(0)
  String? text;
  @HiveField(1)
  String? createdAt;
}

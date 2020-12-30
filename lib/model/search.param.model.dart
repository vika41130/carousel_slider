import 'package:json_annotation/json_annotation.dart';
import 'package:lutoi/model/system.code.dart';

@JsonSerializable(nullable: false)
class SearchParam {
  String param1;
  String param2;
  String param3;

  SearchParam({this.param1, this.param2, this.param3});
  // toJson() {
  //   Map<String, dynamic> m = new Map();
  //   m['param1'] = param1;
  //   m['param2'] = param2;
  //   m['param3'] = param3;
  //   return m;
  // }

  // fromJson(Map<String, dynamic> json) {
  //   if (json == null) return {};
  //   param1 = json['param1'];
  //   param2 = json['param2'];
  //   param3 = json['param3'];
  // }

}
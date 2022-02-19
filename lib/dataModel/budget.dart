import 'package:flutter/material.dart';

class Budget {
  Budget({
    this.id,
    required this.value,
    required this.date,
    this.time,
    this.remark,
    required this.icon,
  });

  final int? id;
  final int value;
  final DateTime date;
  final String? time;
  String? remark;
  final String icon;

  static Budget fromMap(Map<String, dynamic> map) {
    return (Budget(
      id: map["Id"],
      value: map["value"],
      remark: map["remark"],
      date: DateTime.fromMicrosecondsSinceEpoch(map["date"]),
      time: map["time"],
      icon: map["icon"],
    ));
  }

  Map<String, dynamic> toMap() {
    return ({
      "Id": id,
      "value": value,
      "remark": remark,
      "date": date == null ? null : date.millisecondsSinceEpoch,
      "time": time == null ? null : time!,
      "icon": icon,
    });
  }
}

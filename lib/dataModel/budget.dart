import 'package:flutter/cupertino.dart';

final String tableBudget = 'budget';

class BudgetsFields {
  static final String id = '_id';
  static final String value = 'value';
  static final String date = 'date';
  static final String time = 'time';
  static final String remark = 'remark';
  static final String icon = 'icon';
}

class Budget {
  final int? id;
  final int value;
  final DateTime date;
  final DateTime time;
  final String remark;
  final IconData icon;

  const Budget({
    this.id,
    required this.value,
    required this.date,
    required this.time,
    required this.remark,
    required this.icon,
  });
}

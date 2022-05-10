import 'package:flutter/material.dart';

class DatePicker {
  static Future<String> datePicker(BuildContext context) async {
    DateTime _selectedDate = DateTime.now();
    String date = "";
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate, // Refer step 1
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      print(picked.day);

      date = "${picked.month}/${picked.day}/${picked.year}";
    }

    return date;
  }
}

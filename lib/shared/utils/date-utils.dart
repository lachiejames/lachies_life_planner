import 'package:flutter/material.dart';

String mapDateToString(DateTime dateTime) {
  String day = dateTime?.day?.toString()?.padLeft(2, '0');
  String month = dateTime?.month?.toString()?.padLeft(2, '0');
  String year = dateTime?.year?.toString();
  return '$day/$month/$year';
}

String mapTimeToString(TimeOfDay timeOfDay) {
  String hour = timeOfDay?.hourOfPeriod?.toString()?.padLeft(2, '0');
  String minute = timeOfDay?.minute?.toString()?.padLeft(2, '0');
  String period = timeOfDay?.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}

String mapDateToTimeString(DateTime dateTime) {
  if (dateTime == null) {
    return null;
  }

  String hour = (dateTime.hour % 12).toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String period = dateTime.hour < 12 ? 'AM' : 'PM';
  return '$hour:$minute $period';
}

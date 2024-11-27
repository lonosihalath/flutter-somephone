import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }
    String text = newValue.text;
    if (text.length == 4) {
      text += '-';
    } else if (text.length == 7) {
      text += '-';
    } else if (text.length > 10) {
      text = text.substring(0, 10);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  static String timeDifference(String datetime) {
    DateTime apiDateTime;

    try {
      if (datetime.contains('/')) {
        apiDateTime = DateFormat('yyyy/MM/dd HH:mm:ss').parse(datetime);
      } else {
        apiDateTime = DateTime.parse(datetime.substring(0, 19));
      }
    } catch (e) {
      return 'Invalid date';
    }

    DateTime now = DateTime.now();
    Duration difference = now.difference(apiDateTime);

    int seconds = difference.inSeconds;
    int minutes = difference.inMinutes;
    int hours = difference.inHours;
    int days = difference.inDays;

    int years = now.year - apiDateTime.year;
    int months = now.month - apiDateTime.month;

    if (months < 0) {
      years--;
      months += 12;
    }

    if (seconds < 60) {
      return 'just now'.tr;
    } else if (minutes < 60) {
      return '$minutes ${'m'.tr} ${'ago'.tr}';
    } else if (hours < 24) {
      return '$hours ${'h'.tr} ${'ago'.tr}';
    } else if (days < 30) {
      return '$days ${'d'.tr} ${'ago'.tr}';
    } else if (months < 12) {
      return '$months ${'month'.tr} ${'ago'.tr}';
    } else {
      return '$years ${'year'.tr} ${'ago'.tr}';
    }
  }

  static String toDate(String datetime) {
    DateTime parsedDate = DateTime.parse(datetime);
    String formattedDate = DateFormat('dd - MM - yyyy').format(parsedDate);
    return formattedDate;
  }
}

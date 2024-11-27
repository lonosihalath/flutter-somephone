import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var moneyFormat = NumberFormat('#,##0', 'en_US');

void formatPriceText({required TextEditingController textEditingController}) {
  String value = textEditingController.text.replaceAll('.', '');
  if (value.isNotEmpty) {
    int intValue = int.parse(value);
    String formattedValue =
        NumberFormat('#,###').format(intValue).replaceAll(',', ',');
    textEditingController.value = textEditingController.value.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

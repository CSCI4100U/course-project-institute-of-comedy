import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import '../models/Product.dart';

Future showSizePickerDialog(BuildContext context, List sizeSelection) async {
  return await showMaterialNumberPicker(
    headerColor: Colors.orange,
    headerTextColor: Colors.black,
    buttonTextColor: Colors.black,
    maxLongSide: MediaQuery.of(context).size.height / 2,
    context: context,
    title: 'Pick a Size',
    maxNumber: sizeSelection.last,
    minNumber: sizeSelection.first,
    confirmText: 'Confirm',
    cancelText: "Cancel",
  ).then((value) {
    return value;
  });
}

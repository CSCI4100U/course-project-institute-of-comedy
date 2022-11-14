
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import '../models/Product.dart';


Future showNumberPickerDialog(BuildContext context, List sizeSelection) async {
  return await showMaterialNumberPicker(
    maxLongSide: MediaQuery.of(context).size.height / 2,
    context: context,
    title: 'Pick a Size',
    maxNumber: sizeSelection[sizeSelection.length - 1],
    minNumber: sizeSelection[0],
    confirmText: 'Confirm',
    cancelText: "Cancel",
  ).then((value) {
    return value;
  });
}
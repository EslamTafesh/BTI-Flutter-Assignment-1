import 'package:bti_homework_1/data/image_data.dart';
import 'package:bti_homework_1/model/image_info.dart';
import 'package:bti_homework_1/view/screens/image_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageDetails(imageInfo: ImageInfoModel(imageData),),
    ),
  );
}

// ignore_for_file: unrelated_type_equality_checks, camel_case_types

import 'dart:io';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/controller.dart';

class getx_image_picker extends StatelessWidget {
   getx_image_picker({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  List<dynamic> squareImage=['','','',''];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<GetController>(
          builder: (controller) => (data_control.child_image_list[index]==''
              ? FDottedLine(
                  color: const Color(0xFF172927),
                  strokeWidth: 2.0,
                  dottedLength: 8.0,
                  space: 7.0,
                  corner: FDottedLineCorner.all(10.0),
                  child: Container(
                    height: 18.w,
                    width: 18.w,
                    color: Styles.primary_black_light,
                    alignment: Alignment.center,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child:  Image(image: Image.file(File(data_control.child_image_list[index].toString()))
                                        .image)),
                    height: 18.w,
                    width: 18.w,
                  ),
                )),
        ),
        SizedBox(
          height: 18.w,
          width: 18.w,
          child: IconButton(
              onPressed: () async {
                squareImage[index] = (await FilePicker.platform.pickFiles(
                            allowMultiple: false, type: FileType.image))!;
                            final path = squareImage[index].files.single.path;
                if (squareImage[index].toString != 'null') {
                  data_control.child_image_list[index] = path!;
                }
                data_control.update();
              },
             
              icon: const Icon(
                Icons.add,
                color: Styles.primary_green,
                size: 24,
              )),
        ),
      ],
    );
  }

  pickImage1() async {
    final ImagePicker _imagePicker = ImagePicker();
    final _file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      return await _file.readAsBytes();
    }
  }
}

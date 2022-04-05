
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';

class carousel_Slider extends StatelessWidget {
   carousel_Slider({
    Key? key,
    // required this.imageList1,
  }) : super(key: key);

  // final List<Map<String, dynamic>> imageList1;
List<Map<String, dynamic>> imageList = [
  {
  'title':'Help Alice Brain Surgery',
  'image' : 'assets/images/alice fund rising.jpeg',
},
 {
  'title':'Help Ocean',
  'image' : 'assets/images/alice fund rising.jpeg',
},];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
          options: CarouselOptions(
            // enlargeStrategy: CenterPageEnlargeStrategy.scale,
            viewportFraction: 1,  
            // enlargeCenterPage: true, 
            autoPlay: true, 
    disableCenter: false, 
        ),
        items: imageList.map((item) =>   Stack(
          children: [
            SizedBox(
              width: 100.w,
              height: 25.h,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                          item['image']))),
            ),
             Positioned(
                bottom: 40,
                left: 20,
                child: Text(
                  item['title'],
                  style: Styles.Header, 
                ))
          ],
        ),
    ).toList()
    
    );
  }
}

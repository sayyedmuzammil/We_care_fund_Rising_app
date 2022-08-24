// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names, unrelated_type_equality_checks, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/settings/settings.dart';

import '../controller/dbController.dart';
import '../widgets/appbar_main.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final DbController _dbController = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
  _dbController.statusFundrise(); 
  _dbController.getDonationDetails();
  // _dbController.getDonationDetails();

    return Scaffold(
        backgroundColor: Styles.primary_black,
        appBar:Appbar_main(context,true,   IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const SettingsUser(),
                    ),
                  );
                },
                icon: SvgPicture.asset("assets/images/settings_icon.svg")),
              ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GetBuilder<GetController>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.KHeight10,
                Center(
                  child: Stack(
                    children: [
                       Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: /* data_control.profileImage != null
                                        ? DecorationImage(
                                            image: MemoryImage(
                                                data_control.profileImage!),
                                            //NetworkImage(image!),
                                            fit: BoxFit.cover,
                                          )
                                        :  */DecorationImage(
                                            image: NetworkImage(data_control
                                                .user!.photoUrl
                                                .toString()),
                                            fit: BoxFit.cover,
                                          ))),
                          ],
                        ),
                    
                    /*   Positioned(
                        bottom: 0,
                        right: 130,
                        child: InkWell(
                          onTap: () async {
                            var val = await pickImage();
                            if (val.toString != 'null') {
                              data_control.profileImage = val;
                              data_control.update();
                            }
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Styles.primary_green,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                     */
                    ],
                  ),
                ),
                Styles.KHeight20,
                Center(
                  child: Text(
                    data_control.user?.name.toString() ?? 'Profile name',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Styles.KHeight20,
                SizedBox(
                  height: 8.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GetBuilder<DbController>( 
                            builder: (controller) => Text(
                              _dbController.myFundrise.length.toString(),
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Fundraising",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: double.infinity,
                        width: .5,
                        color: Colors.grey[800],
                      ),
                      Column(
                        children:  [
                          GetBuilder<DbController>(
            builder: (controller) =>
                          Text(
                            _dbController.myDonations.length.toString(),
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          ), 
                          Spacer(),
                          Text(
                            "Donation",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Styles.KHeight20,
                Container(
                  width: double.infinity,
                  height: .5,
                  color: Colors.grey[800],
                ),
                Styles.KHeight20,
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'About',
                    style: Styles.Header,
                  ),
                ),
                Styles.KHeight10,
                Text(
                  data_control.user?.about ?? 'About of user',
                  style: const TextStyle(
                      fontSize: 15, color: Colors.white, wordSpacing: 1.4),
                ),
                Styles.KHeight10,
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        "Interest",
                        style: Styles.Header,
                      ),
                      IconButton(
                        onPressed: () {
                          print("edit interest");
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Styles.primary_green,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 15,
                  children: [
                    my_intersests_button(
                      interest: 'Medical',
                    ),
                    my_intersests_button(
                      interest: 'Disaster',
                    ),
                    my_intersests_button(
                      interest: 'Education',
                    ),
                    my_intersests_button(
                      interest: 'Social',
                    ),
                    my_intersests_button(
                      interest: 'Orphanage',
                    ),
                    my_intersests_button(
                      interest: 'Humanity',
                    ),
                    my_intersests_button(
                      interest: 'Environment',
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  Widget my_intersests_button({required String interest}) {
    return TextButton(
      child: Text(
        interest,
        style: const TextStyle(fontSize: 16),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Styles.primary_black,
        primary: Styles.primary_green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        side: const BorderSide(color: Styles.primary_green),
      ),
      onPressed: () {},
    );
  }

  pickImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }

      return await img.readAsBytes();
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }
}

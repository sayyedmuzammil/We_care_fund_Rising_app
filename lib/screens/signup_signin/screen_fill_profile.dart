// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/resources/storage_methods.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/new_fundraising.dart';
import 'package:we_care/screens/signup_signin/screen_yourInterest.dart';
import '../../db_functions/auth_method.dart';
import '../../db_functions/controller.dart';
import '../../db_functions/user_model.dart';
import '../../widgets/appBarHead.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FillProfile extends StatelessWidget {
  FillProfile({this.email = '', this.password = ''});
  String email;
  String password;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneControler = TextEditingController();
  final _genderController = TextEditingController();
  final _cityController = TextEditingController();
  final _aboutController = TextEditingController();
  final _globalKey2 = GlobalKey<FormState>();

  final List<String> items = [
    'Female',
    'Male',
    'Others',
  ];
  String? selectedValue;
  String? _gender;
  String photoUrl = '';

  void init() {
    _emailController.text = email;
    if (data_control.editProfile == true) {
      _nameController.text = data_control.user!.name.toString();
      _emailController.text = data_control.user!.email.toString();
      _phoneControler.text = data_control.user!.phoneNumber.toString();
      _gender = data_control.user!.gender.toString();
      _cityController.text = data_control.user!.city.toString();
      _aboutController.text = data_control.user!.about.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    init();

    // print("in build profile $password and $email");
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBarHead(data_control.editProfile == false
          ? "Fill Your Profile"
          : "Edit Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView(
            children: [
              Styles.KHeight20,
              Center(
                child: Stack(
                  children: [
                    GetBuilder<GetController>(
                      builder: (controller) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: controller.editProfile == true &&
                                          controller.profileImage == null
                                      ? DecorationImage(
                                          image: NetworkImage(controller
                                              .user!.photoUrl
                                              .toString()),
                                          fit: BoxFit.cover,
                                        )
                                      : controller.profileImage != null
                                          ? DecorationImage(
                                              image: MemoryImage(
                                                  controller.profileImage!),
                                              //NetworkImage(image!),
                                              fit: BoxFit.cover,
                                            )
                                          : const DecorationImage(
                                              image: NetworkImage(
                                                  'https://th.bing.com/th/id/OIP.0i7tOueCViNYUKRiC4La9gHaHa?pid=ImgDet&rs=1'),
                                              fit: BoxFit.cover,
                                            ))),
                        ],
                      ),
                    ),
                   

                    Positioned(
                      bottom: 0,
                      right: 130,
                      child: InkWell(
                        onTap: () async {
                          var val = await pickImage();
                          print("unit $val");
                          if (val.toString != 'null') {
                            // val=vall;
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
                  ],
                ),
              ),
              Styles.KHeight20,
              Form(
                key: _globalKey2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Styles.KWidth20,
                        const Text(
                          "Full Name",
                          style: Styles.RegularTextBold,
                        ),
                        Text(
                          "*",
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _nameController,
                      hintText: 'Full Name',
                      // validation: validation(_nameController.text),
                    ),
                    Styles.KHeight20,
                    Row(
                      children: [
                        Styles.KWidth20,
                        const Text(
                          "Email",
                          style: Styles.RegularTextBold,
                        ),
                        Text(
                          "*",
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _emailController,
                      hintText: 'Email',
                      isVisible: true,
                      inputType: TextInputType.none,
                      inputColor: Colors.grey,
                      // validation: validation(_emailController.text),
                      suffix_icon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                    Styles.KHeight20,
                    Row(
                      children: [
                        Styles.KWidth20,
                        const Text(
                          "Phone Number",
                          style: Styles.RegularTextBold,
                        ),
                        Text(
                          "*",
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _phoneControler,
                      hintText: 'Phone Number',
                      isVisible: true,
                      inputType: TextInputType.number,
                      // validation: validation(_phoneControler.text),
                      suffix_icon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                    Styles.KHeight20,
                    Row(
                      children: [
                        Styles.KWidth20,
                        const Text(
                          "Gender",
                          style: Styles.RegularTextBold,
                        ),
                        Text(
                          "*",
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),

                    GetBuilder<GetController>(
                      builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            isExpanded: true,
                            hint: Expanded(
                              child: Text(
                                _gender == null ? 'Select Item' : '$_gender',
                                style: _gender == null
                                    ? Styles.RegularText.copyWith(
                                        color: const Color(0xFF37424F),
                                      )
                                    : const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                //  overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          //  fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: controller.selectedValueDrop,
                            onChanged: (value) {
                              controller.selectedValueDrop =
                                  value as String;
                              controller.update();

                              // });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 24,
                            iconEnabledColor: Colors.grey,
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 50,
                            //  buttonWidth: 160,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 12),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Styles.primary_black_light,
                            ),
                            buttonElevation: 2,
                            itemHeight: 40,
                            itemPadding:
                                const EdgeInsets.only(left: 20, right: 12),
                            //  dropdownMaxHeight: 200,
                            //  dropdownWidth: 200,
                            dropdownPadding: null,

                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Styles.primary_black_light,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(20),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-0, 0),
                          )),
                        );
                      },
                    ),

                    // text_field(
                    //   Text_field_controller: _genderController,
                    //   hintText: 'Gender',
                    //   isVisible: true,
                    //   suffix_icon: const Icon(
                    //     Icons.arrow_drop_down,
                    //     color: Colors.grey,
                    //     size: 24,
                    //   ),
                    // ),
                    Styles.KHeight20,
                    Row(
                      children: [
                        Styles.KWidth20,
                        const Text(
                          "City",
                          style: Styles.RegularTextBold,
                        ),
                        Text(
                          "*",
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _cityController,
                      // validation: validation(_cityController.text),
                      hintText: 'city',
                      isVisible: true,
                      suffix_icon: const Icon(
                        Icons.person_pin_circle_outlined,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                    Styles.KHeight20,
                    Row(
                      children: const [
                        Styles.KWidth20,
                        Text(
                          "About",
                          style: Styles.RegularTextBold,
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _aboutController,
                      hintText: 'About',
                      // validation: validation(_aboutController.text),
                    ),
                    Styles.KHeight20,
                    Styles.KHeight10,
                    SizedBox(
                      height: 13.w,
                      width: 100.w,
                      child: TextButton(
                        child: Text(
                          data_control.editProfile == false
                              ? 'Continue'
                              : "Save Changes",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Styles.primary_green,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0)),
                          side: const BorderSide(color: Styles.primary_green),
                        ),
                        onPressed: () async {
                          var res = await validator();
                          if (res != 'success') {
                            Get.snackbar(
                              'Error', "$res",
                              animationDuration: Duration(milliseconds: 500),
                              duration: Duration(seconds: 1),
                              icon: Icon(
                                Icons.error,
                                size: 36,
                                color: Colors.black,
                              ),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Color.fromARGB(255, 235, 75, 75)
                                  .withOpacity(1),
                              colorText: Colors.white,
                           margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            );
                          } else {
                            await profileSubmitted();

                            Get.snackbar(
                              'Success',
                              "Form submitted Successfully",
                              animationDuration: Duration(milliseconds: 500),
                              duration: Duration(seconds: 1),
                              icon: Icon(
                                Icons.done_all,
                                size: 36,
                                color: Colors.black,
                              ),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Color.fromARGB(255, 44, 184, 102)
                                  .withOpacity(.7),
                              colorText: Colors.white,
                              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            );
                            if (data_control.editProfile == true) {
                              data_control.editProfile = false;
                              await data_control.refreshUser();
                              data_control.update();
                              Navigator.pop(context);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const InterestScreen()),
                              );
                            }
                          }
                       
                        },
                      ),
                    ),
                    Styles.KHeight20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }
      // data_control.profileImage = await img.path.;
      // print(await data_control.profileImage);
      return await img.readAsBytes();
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  profileSubmitted() async {
    User? currentUser = db_control.auth.currentUser;
    String name = _nameController.text;
    String email = _emailController.text;
    String number = _phoneControler.text;
    String gender = _gender ?? _genderController.text;
    String city = _cityController.text;
    String about = _aboutController.text;
    var usermodel = userModel(
      userId: currentUser!.uid,
      photoUrl: photoUrl,
      name: name,
      email: email,
      phoneNumber: int.parse(number),
      gender: gender,
      city: city,
      about: about,
    );
    print("i am beginning db");
    await db_control.firestrore
        .collection('users')
        .doc(currentUser.uid)
        .set(usermodel.toMap());
    print("i am after db");
  }

  Future<String> validator() async {
    var name = _nameController.text;
    var number = _phoneControler.text;
    var city = _cityController.text;
    var res;
    var gender;
    if (data_control.selectedValueDrop == null) {
      gender = _gender;
    } else {
      gender = data_control.selectedValueDrop;
    }

    photoUrl = await data_control.editProfile == true &&
            data_control.profileImage == null
        ? await data_control.user!.photoUrl.toString()
        : await StorageMethods().uploadImageToStorage(
            childName: 'profilePics',
            file: data_control.profileImage!,
            isPost: false,
            uuid: db_control.auth.currentUser!.uid);

    if (photoUrl == null) {
      res = "Add your profile picture";
    } else if (name.isEmpty || name.length <= 2 || name[0] == ' ') {
      res = "Name is required minimum 3 character";
    } else if (number.isEmpty) {
      res = "Mobile number is required";
    } else if (gender == null) {
      res = "Please Select your gender";
    } else if (number.length != 10 ||
        number.contains('.') ||
        number.contains('-') ||
        number.contains(',') ||
        number.contains(' ')) {
      res = "Please enter valid mobile number";
    } else if (city.isEmpty || city.length <= 2 || city[0] == ' ') {
      res = "city is required minimum 3 character";
    } else {
      res = "success";
    }
    return res;
  }
}

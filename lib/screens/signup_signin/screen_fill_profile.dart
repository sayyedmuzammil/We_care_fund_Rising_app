// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

// import 'dart:html';
// import 'dart:typed_data';

import 'dart:typed_data';

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
  Uint8List? val;

  void init() {
    _emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    init();
    print("in build profile $password and $email");
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBarHead(data_control.editProfile==false? "Fill Your Profile": "Edit Profile"),
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
            builder: (controller)  =>Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                width: 130.0,
                                                height: 130.0,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: data_control.profileImage != null
                                                        ? DecorationImage(
                                                            image: MemoryImage(
                                                                data_control.profileImage!),
                                                            //NetworkImage(image!),
                                                            fit: BoxFit.cover,
                                                          )
                                                        : DecorationImage(
                                                            image: NetworkImage(
                                                                'https://th.bing.com/th/id/OIP.0i7tOueCViNYUKRiC4La9gHaHa?pid=ImgDet&rs=1'),
                                                            fit: BoxFit.cover,
                                                          ))),
                                          ],
                                        ),),
                    // child:
                    // data_control.profileImage!=''?
                    // Image(image: MemoryImage(val!)) : Image(image: AssetImage('assets/images/profile_avatar.png'))
        
                    Positioned(
                      bottom: 0,
                      right: 130, 
                      child: InkWell(
                        onTap: () async {
                         var val=await pickImage();
                      //  print("unit $vall");
                           if (val.toString != 'null') {
                    // val=vall;
                    data_control.profileImage=val;
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
                          style:
                              Styles.RegularTextBold.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _nameController,
                      hintText: 'Full Name',
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
                          style:
                              Styles.RegularTextBold.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _emailController,
                      hintText: 'Email',
                      isVisible: true,
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
                          style:
                              Styles.RegularTextBold.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _phoneControler,
                      hintText: 'Phone Number',
                      isVisible: true,
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
                          style:
                              Styles.RegularTextBold.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _genderController,
                      hintText: 'Gender',
                      isVisible: true,
                      suffix_icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
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
                          style:
                              Styles.RegularTextBold.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    text_field(
                      Text_field_controller: _cityController,
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
                    ),
                    Styles.KHeight20,
                    Styles.KHeight10,
                    SizedBox(
                      height: 13.w,
                      width: 100.w,
                      child: TextButton(
                        child:  Text(
                          data_control.editProfile==false?
                          'Continue':"Saave Changes", 
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
                        onPressed: () async{
                         var res= await profileSubmitted();
                         print("after submit $res");
                         if(res=="success"){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InterestScreen()),
                          );
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

  Future<String> profileSubmitted() async {
User? currentUser= db_control.auth.currentUser;
String photoUrl='';
print("before upload to firebase image ${data_control.profileImage}");
if(data_control.profileImage!=null){
 photoUrl= await StorageMethods().uploadImageToStorage(childName:  'profilePics',file:  data_control.profileImage!,isPost:  false, uuid: currentUser!.uid);
}
    // UserCredential Cred=db_control.cred;
    String name = _nameController.text;
// String email=_emailController.text;
    String number = _phoneControler.text;
    String gender = _genderController.text;
    String city = _cityController.text;
    String about = _aboutController.text;
    
var res;
if(name.isEmpty || name.length<=3){
 res= "Name is required minimum 3 character";
}
// else if(email.isEmpty ){
//   res="email is required ";
// }
else if(number.length!=10){
  res="Number error";
}
else if(gender.isEmpty){
  res="gender is required";
}
else if(city.isEmpty || city.length<=3){
  res="city is required minimum 3 character";
}
else{
  res="success";
  print("successfully completed");
 var usermodel= userModel(
      userId: currentUser!.uid,
      photoUrl: photoUrl,
      name: name,
      email: email, 
      // password: password,
      phoneNumber: int.parse(number), 
      gender: gender, 
      city: city, 
      about: about, 
    );
    print("i am beginning db");
     await db_control.firestrore.collection('users').doc(currentUser.uid).set(usermodel.toMap());
     print("i am after db");
}
    
return res;

  }
}

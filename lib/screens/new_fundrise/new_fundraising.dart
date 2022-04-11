// ignore_for_file: camel_case_types, unrelated_type_equality_checks, must_be_immutable, use_key_in_widget_constructors

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/new_fundrise/coverPhoto.dart';
import 'package:we_care/screens/new_fundrise/image_square.dart';

class newFundrising extends StatelessWidget {
  newFundrising({Key? key}) : super(key: key);

  final _titleController = TextEditingController();
    final _categoryController = TextEditingController();
      final _requiredAmountController = TextEditingController();
        final _dateController = TextEditingController();
          final _recipientController = TextEditingController();
      final _uploadProposalController = TextEditingController();
        final _uploadMedicalController = TextEditingController();
    final _globalKey = GlobalKey<FormState>();
/*   void initState() {
    selectedcontent.isNotEmpty
        ? {
            _categoryController.text = selectedcontent['item'].toString(),
       
          }
        : dataControl.selectedDate = DateTime.now();
    // dataControl.update();
  } */
  Uint8List? val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "Create New Fundraising",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
              },
              icon: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Styles.primary_green,
                  )));
        }),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
// crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           cover_Photo(), 
            Styles.KHeight20,
            Wrap(
              spacing: 22.0,
              children: const [
                getx_image_picker(
                  index: 0,
                ),
                getx_image_picker(
                  index: 1,
                ),
                getx_image_picker(
                  index: 2,
                ),
                getx_image_picker(
                  index: 3,
                ),
              ],
            ),
            Styles.KHeight20, 
            Text("Fundraising Details ", style: Styles.Header, ), 
            Styles.KHeight10, 
            
            Form(
                                  key: _globalKey,
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start, 
                                    children: [
                                    Row(children: [
                                        Styles.KWidth20, 
                                      Text("Title",style: Styles.RegularTextBold,), 
                                      Text("*", style: Styles.RegularTextBold.copyWith(color: Colors.red),), 
                                    ],), 
                                       text_field(Text_field_controller: _titleController,hintText: 'Title',),  
                                      Styles.KHeight10, 
                                       Row(children: [
                                        Styles.KWidth20, 
                                      Text("Category",style: Styles.RegularTextBold,), 
                                      Text("*", style: Styles.RegularTextBold.copyWith(color: Colors.red),), 
                                    ],), 
                                       text_field(Text_field_controller: _categoryController,hintText: 'Category', isVisible: true,suffix_icon: Icon(Icons.arrow_drop_down,color: Colors.grey,size: 24,),), 
                                        Styles.KHeight10, 
                                        Row(children: [
                                        Styles.KWidth20, 
                                      Text("Total Donation Required",style: Styles.RegularTextBold,), 
                                      Text("*", style: Styles.RegularTextBold.copyWith(color: Colors.red),), 
                                    ],), 
                                       text_field(Text_field_controller: _requiredAmountController,hintText: '0', isVisible: true,suffix_icon: Icon(Icons.attach_money_outlined,color: Colors.grey,size: 20,),),

                                        Styles.KHeight10, 
                                        Row(children: [
                                        Styles.KWidth20, 
                                      Text("Choode Donation Expiration Date",style: Styles.RegularTextBold,), 
                                      Text("*", style: Styles.RegularTextBold.copyWith(color: Colors.red),), 
                                    ],), 
                                       text_field(Text_field_controller: _dateController,hintText: 'Select Date', isVisible: true,suffix_icon: Icon(Icons.event_outlined,color: Colors.grey,size: 20,),),   
    Styles.KHeight10, 
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),  
                                        child: Container(height: 1, color:Color(0xFF37424F),),
                                      ), 
                                        Styles.KHeight20, 
                                           Text("Donation Recipient Details ", style: Styles.Header, ), 
        
             Styles.KHeight20, 
                                       Row(children: [
                                        Styles.KWidth20, 
                                      Text("Name of Recipients (People/Organization) ",style: Styles.RegularTextBold,), 
                                      Text("*", style: Styles.RegularTextBold.copyWith(color: Colors.red),), 
                                    ],), 
                                       text_field(Text_field_controller: _recipientController,hintText: 'Name',),

                                       Styles.KHeight10, 
                                       Row(children: [
                                        Styles.KWidth20, 
                                      Text("Upload Donation Proposal Documents",style: Styles.RegularTextBold,), 
                                      Text("*", style: Styles.RegularTextBold.copyWith(color: Colors.red),), 
                                    ],), 
                                       text_field(Text_field_controller: _uploadProposalController,hintText: 'Select Document', isVisible: true,suffix_icon: Icon(Icons.cloud_upload_sharp,color: Colors.grey,size: 22,),), 

                                       Styles.KHeight10, 
                                       Row(children: [
                                        Styles.KWidth20, 
                                      Text("Upload Medical Documents (optional for medical)",style: Styles.RegularTextBold,), 
                                    
                                    ],), 
                                       text_field(Text_field_controller: _categoryController,hintText: 'Select Document', isVisible: true,suffix_icon: Icon(Icons.cloud_upload_sharp,color: Colors.grey,size: 22,),),  
                                   Styles.KHeight20, 
                                    ],
                                  ),
            ), 



          ],
        ),
      )),
    );
  }
}

class text_field extends StatelessWidget {
   text_field({
    required TextEditingController this.Text_field_controller,
   this.isVisible=false,
    this.suffix_icon=const Icon(Icons.ac_unit),
    this.hintText='',
  });

   final TextEditingController Text_field_controller;
  bool isVisible;
  Icon suffix_icon;
  var hintText;

  @override
  Widget build(BuildContext context) {
    print(isVisible);
    return Card(
        shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(70, ),  
          ),   
      color: Styles.primary_black_light,  
    
      child: TextFormField(
    
      style: TextStyle(color: Colors.white), 
        controller: Text_field_controller,
        decoration: InputDecoration(
         
         border: InputBorder.none,
          contentPadding:
              const EdgeInsets.only(
                left: 20 ,
                top: 12,     
          ),
          hintText: hintText, 
           suffixIcon: Visibility(
            
             visible: isVisible,
             child: suffix_icon,), 
          hintStyle: Styles.RegularText.copyWith(color: Color(0xFF37424F) ,     ), 
              
        ),
        validator:(value) {
           (value){
 if (value == null ||
              value.isEmpty) {
            return 'Item is required';
          } else if (value
              .startsWith(" ")) {
            return "Item should not contain whitespace";
          }
  };
        },
      ),
    );
  }
}

pickImage1() async {

  final ImagePicker _imagePicker = ImagePicker();
  final _file = await _imagePicker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return await _file.readAsBytes();
  }

}

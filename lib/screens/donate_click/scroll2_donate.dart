import 'package:flutter/material.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/controller.dart';

Padding scroll2(data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Styles.KHeight20,
        const Text(
          'Fundraiser',
          style: Styles.Header,
        ),
        Styles.KHeight10,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Styles.KWidth10,
             CircleAvatar(
              backgroundColor: Styles.primary_black,
              radius: 25,
              backgroundImage: 
                                           NetworkImage(data_control
                                              .user!.photoUrl
                                              .toString()),
                                          // fit: BoxFit.cover,
                                      
                                            
            ),
            Styles.KWidth20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  data_control.user!.name!,
                  style: Styles.Header,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'verified ',
                      style: Styles.RegularText.copyWith(
                          color: Colors.white, fontSize: 14),
                    ),
                    const Icon(
                      Icons.verified_outlined,
                      color: Styles.primary_green,
                      size: 16,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        Styles.KHeight20,
        const Text(
          'Patiant',
          style: Styles.Header,
        ),
        Styles.KHeight10,
        avatar_title(
          'Alice Wilson',
          'Identity according to medical documents ',
          const Icon(
            Icons.perm_identity_outlined,
            color: Styles.primary_green,
          ),
        ),
        Styles.KHeight20,
        avatar_title(
          'Post medical admin',
          'Accompanied by medical documents ',
          const Icon(
            Icons.medical_services_outlined,
            color: Styles.primary_green,
          ),
        ),
        Styles.KHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Fund Usage Plan',
              style: Styles.Header,
            ),
            TextButton(
              child: const Text(
                '  View Plan  ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Styles.primary_black,
                primary: Styles.primary_green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0)),
                side: const BorderSide(color: Styles.primary_green),
              ),
              onPressed: () {
                print('Pressed');
              },
            ),
          ],
        ),
        Styles.KHeight20,
        const Text(
          'Story',
          style: Styles.Header,
        ),
        Styles.KHeight10,
        Text(
         data.story!,
          style: Styles.RegularText.copyWith(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        Styles.KHeight20,
      ],
    ),
  );
}

Row avatar_title(title, subtitle, Icon avatar) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Styles.KWidth10,
      CircleAvatar(
        backgroundColor: Styles.primary_green_light,
        radius: 25,
        child: avatar,
      ),
      Styles.KWidth20,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.Header,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                subtitle,
                style: Styles.RegularText.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const Icon(
                Icons.verified_outlined,
                color: Styles.primary_green,
                size: 16,
              )
            ],
          )
        ],
      ),
    ],
  );
}

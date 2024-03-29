import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';

class ScreenDonators extends StatelessWidget {
  final FundriseModel data;
  const ScreenDonators({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: Text(
          data.donatorsCount.toString(),
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Styles.primary_green,
                    )),
              ));
        }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/search_svg.svg")),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              itemCount: data.donatorsCount!,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 30,
                );
              },
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Styles.KWidth10,
                    CircleAvatar(
                      backgroundColor: Styles.primary_black,
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/images/profile_avatar.png'),
                    ),
                    Styles.KWidth20,
                    Text(
                      'Anonymous',
                      style: Styles.Header,
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}

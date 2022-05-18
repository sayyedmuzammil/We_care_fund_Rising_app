import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:we_care/widgets/appBarHead.dart';


import '../constant_design.dart';

class FaqScreen extends StatelessWidget {
   FaqScreen({ Key? key }) : super(key: key);
 final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.primary_black,
        appBar: AppBarHead('FAQ'),
        body: Padding(
          padding:  EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              ExpansionTile("What is Wecare?",""" Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", true),
              Styles.KHeight20, 
              ExpansionTile("How to use Wecare?","""Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", false),
               Styles.KHeight20, 
              ExpansionTile("Can I create my own fundraising?","""Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", false),
               Styles.KHeight20, 
              // ExpansionTile("How to top up balance on Wecare?","""Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", false),
              //  Styles.KHeight20, 
              ExpansionTile("Is there a free tips to use this app","""Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", false),
               Styles.KHeight20, 
              ExpansionTile("Is Wecare free to use?","""Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", false),
               Styles.KHeight20, 
              // ExpansionTile("How to use Wecare?","""Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", false),
            
            ],
          ),
        ),
          
      
      
    );
  }

  ExpansionTileCard ExpansionTile(title, subTitle, isExpand) {
    return ExpansionTileCard(
                  // key: cardA,
                  elevation: 5, 
                  animateTrailing: true,
                  initiallyExpanded: isExpand,
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  baseColor: Styles.primary_black_light,  
                  expandedTextColor: Styles.primary_green,
                  expandedColor: Styles.primary_black_light, 
                  shadowColor: Styles.primary_green, 
                  // colorCurve: Curves.easeInSine,  
                  trailing: Icon(Icons.arrow_drop_down, color: Styles.primary_green, ),
                  title: Text(title, style: Styles.RegularTextBold.copyWith(color: Colors.white)),
                  // subtitle: Text('I expand, too!'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 20), 
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.grey[800] ,    
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, 
                          vertical: 18.0, 
                        ),
                        child: Text(
                          subTitle,
                          style: Styles.RegularText.copyWith(color: Colors.white), 
                        ),
                      ),
                    ),
               ],
                );
  }
}
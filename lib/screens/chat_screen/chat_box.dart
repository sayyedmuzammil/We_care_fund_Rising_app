import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../db_functions/user_model.dart';
import 'messages/components/chat_input_field.dart';
import 'messages/components/message.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final _controller = ScrollController();

  ScrollPhysics _physics = const ClampingScrollPhysics();
  String recieverId = '81vQxPl3nngEE9BjlSjrsSrPNdi1';
  String _profile = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels <= 56) {
        setState(() => _physics = const BouncingScrollPhysics());
      } else {
        setState(() => _physics = const BouncingScrollPhysics());
      }
    });

    if (FirebaseAuth.instance.currentUser!.uid == recieverId) {
      recieverId = 'yltPeMZYadYAzJYl3Hu9c4k6KKs1';
    }
  }
  final _chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
         bottom: PreferredSize(
      child: Container(
         color: Styles.primary_green, 
         height: 2.0,
      ),
      preferredSize: Size.fromHeight(5.0)),    
        // elevation: 4, 
        backgroundColor: Styles.primary_black, 
        title: FutureBuilder<userModel>(
            future: data_control.getFundriseUser(recieverId),
            builder: (context, snap) {
              if (snap.data == null) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.red,
                  ),
                );
              }
              return Text(
                snap.data!.name!,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              );
            }),
        leading: FutureBuilder<userModel>(
            future: data_control.getFundriseUser(recieverId),
            builder: (context, snap) {
              if (snap.data == null) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.red,
                  ),
                );
              } else {
                _profile = snap.data!.photoUrl!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8), 
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      snap.data!.photoUrl!,
                    ),
                    maxRadius: 10,
                  ),
                );
              }
            }),
        centerTitle: false,
        toolbarHeight: 7.h,
      ),
      backgroundColor: Styles.primary_black,
      body: Stack(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('messages')
                  .doc(recieverId)
                  .collection('chats')
                  .orderBy('date_fb', descending: false)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.docs.length < 1) {
                    return const Center(
                      child: Text("Say Hi... ", style: Styles.RegularText),
                    );
                  } else {
                    final _check = snapshot.data.docs[0];
                    bool _checkSamePerson = !_check['isSender_fb'];
                    bool _checkRepeat;
                    return ListView.builder(
                      controller: _controller,
                      reverse: false,
                      physics: _physics,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {

                        ///Checking same sender
                        final _singleMessage = snapshot.data.docs[index];

                        if (_checkSamePerson == _singleMessage['isSender_fb']) {
                          _checkRepeat = true;
                        } else {
                          _checkRepeat = false;
                          _checkSamePerson = _singleMessage['isSender_fb'];
                        }

                        // Checking same date
                        bool isSameDate = true;

                        final DateTime date = DateTime.parse(
                            snapshot.data.docs[index]['date_fb']);
                        if (index == 0) {
                          isSameDate = false;
                        } else {
                          final DateTime prevDate = DateTime.parse(
                              snapshot.data.docs[index - 1]['date_fb']);
                          isSameDate = date.isSameDate(prevDate);
                        }

                        //building message
                          return Column(
                            children: [
                             !isSameDate? Center(
                                child: Card(
                                  margin: const EdgeInsets.only(top: 10),
                                  color: Styles.primary_green_light,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      DateFormat.yMMMd().format(DateTime.parse(
                                          snapshot.data.docs[index]
                                              ['date_fb'])),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ):Container(), 
                              Messsage(
                                profile: _profile,
                                isSamePerson: _checkRepeat,
                                message: snapshot.data.docs[index],
                              ),
                              index == snapshot.data.docs.length - 1
                                  ? const SizedBox(
                                      height: 70,
                                    )
                                  : Container(),
                            ],
                          );
                        } 
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )),

          ChatInputField(
            chatController: _chatController,
            recieverId: recieverId,
          ),

        ],
      ),
    );
  }

}

const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

}

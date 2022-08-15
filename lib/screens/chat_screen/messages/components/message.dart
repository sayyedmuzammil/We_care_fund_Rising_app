import 'package:flutter/material.dart';
import 'package:we_care/screens/chat_screen/messages/components/text_message.dart';
import '../../../../constant_design.dart';
import 'chat_message_dot.dart';

class Messsage extends StatelessWidget {
  const Messsage(
      {Key? key,
      required this.message,
      required this.isSamePerson,
      required this.profile})
      : super(key: key);

  final message;
  final bool isSamePerson;
  final String profile;

  // var groupByDate=groupBy(message, (obj)=> obj['date'].substring(0,10));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: message['isSender_fb']
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!message['isSender_fb']) ...[
                isSamePerson
                    ? const SizedBox(
                        width: 30,
                      )
                    : CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(profile),
                      )
              ],
              Styles.KWidth10,
              TextMessage(
                isSamePerson: isSamePerson,
                message: message,
              ),
              isSamePerson
                  ? const SizedBox(
                      width: 8,
                    )
                  : Container(),
              if (message['isSender_fb'])
                MessageStatusDot(status: message['status_fb'])
            ],
          ),
        ],
      ),
    );
  }
}

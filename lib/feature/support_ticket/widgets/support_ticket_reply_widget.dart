import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';


class SupportTicketReplyWidget extends StatelessWidget {
  final bool isMe;
  final String dateTime;
  final String? message;

  const SupportTicketReplyWidget({super.key, required this.isMe, required this.dateTime, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: isMe ? CrossAxisAlignment.end:CrossAxisAlignment.start, children: [
      Container(margin: isMe ?  const EdgeInsets.fromLTRB(50, 5, 10, 5) : const EdgeInsets.fromLTRB(10, 5, 50, 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              bottomLeft: isMe ? const Radius.circular(10) : const Radius.circular(0),
              bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(10),
              topRight: const Radius.circular(10)),
              color: isMe ? systemPrimaryColor().withValues(alpha:.1) : Theme.of(context).highlightColor),
          child: Column(crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, children: [
                Text(dateTime, style: textRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)),


                message != null ?
                Text(message??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault)) :
                const SizedBox.shrink()])),

    ],
    );
  }
}

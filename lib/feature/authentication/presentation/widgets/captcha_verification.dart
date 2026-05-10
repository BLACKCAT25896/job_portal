import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/feature/authentication/logic/authentication_controller.dart';

class CaptchaVerificationWidget extends StatefulWidget {
  const CaptchaVerificationWidget({super.key});

  @override
  CaptchaVerificationWidgetState createState() => CaptchaVerificationWidgetState();
}

class CaptchaVerificationWidgetState extends State<CaptchaVerificationWidget> {
  late int num1;
  late int num2;
  late int correctAnswer;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateChallenge();
  }

  void _generateChallenge() {
    setState(() {
      num1 = Random().nextInt(10) + 5;
      num2 = Random().nextInt(5);
      correctAnswer = num1 - num2;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.refresh, color: Colors.blue[700], size: 20),
          onPressed: _generateChallenge,
        ),

        // The Math Challenge Box
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade200),
          ),
          child: Text(
            "$num1 - $num2 =",
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        SizedBox(width: 12),

        Expanded(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Type the verification code",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            onChanged: (value) {
              if (int.tryParse(value) == correctAnswer) {
                Get.find<AuthenticationController>().setCaptchaVerified(true);
              }
            },
          ),
        ),
      ],
    );
  }
}
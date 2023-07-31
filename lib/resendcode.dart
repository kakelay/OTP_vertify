import 'package:flutter/material.dart';

class ReSendCode extends StatefulWidget {
  const ReSendCode({super.key});

  @override
  State<ReSendCode> createState() => _ReSendCodeState();
}

class _ReSendCodeState extends State<ReSendCode> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff7f6fb),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 32,
            color: Colors.black54,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "ResendCode",
        ),
      ),
    );
  }
}
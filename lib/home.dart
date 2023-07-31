import 'package:flutter/material.dart';

class HoemPage extends StatefulWidget {
  const HoemPage({super.key});

  @override
  State<HoemPage> createState() => _HoemPageState();
}

class _HoemPageState extends State<HoemPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      
      appBar: AppBar(
        title: const Text('Home',style:TextStyle(color: Colors.black
        ),),
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
          "Home",
        ),
      ),
    );
  }
}
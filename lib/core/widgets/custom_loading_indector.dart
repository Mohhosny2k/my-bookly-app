import 'package:flutter/material.dart';

class CustomLoadingIndector extends StatelessWidget {
  const CustomLoadingIndector({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(child:  CircularProgressIndicator());
  }
}
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: const CustomAppBar(title :'Request Blood'),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}

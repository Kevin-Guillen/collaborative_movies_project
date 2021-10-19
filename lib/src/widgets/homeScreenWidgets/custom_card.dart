import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';
import '../global_back_button.dart';

class CustomCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget profile;

  const CustomCard({
    Key? key,
    this.backgroundColor = Colors.black,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profile,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          UiConstants.paddingBackButton,
        ),
        child: GlobalBackButton(),
      ),
      backgroundColor: backgroundColor,
    );
  }
}

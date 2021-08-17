import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';
import 'drawer_profiles.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.profile,
  }) : super(
          key: key,
        );

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: UiConstants.profilesTopPadding,
      ),
      child: ListTile(
        title: Text(
          profile.name,
          style: TextStyle(
            fontSize: UiConstants.profileNamesFontSize,
          ),
        ),
        leading: CircleAvatar(
          radius: UiConstants.profileImageRadius,
          backgroundImage: AssetImage(
            profile.urlImage,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_right_sharp,
          color: Colors.black,
          size: UiConstants.profileArrowIconSize,
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => profile.widget,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/ui_constants.dart';

class KevinCard extends StatelessWidget {
  @override
  Widget build(buildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UiConstants.kevinCardTitle,
      home: Scaffold(
        backgroundColor: Colors.purple.shade200,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                UiConstants.kevinCardBackgroundImage,
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: UiConstants.avatarBlurShadow,
                          color: Colors.black,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        UiConstants.kevinImage,
                      ),
                      radius: UiConstants.avatarRadius,
                    ),
                  ),
                  SizedBox(
                    height: UiConstants.avatarAndPersonNameSizeBoxHeight,
                  ),
                  Text(
                    UiConstants.kevinFullName,
                    style: TextStyle(
                      fontSize: UiConstants.personNameFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: UiConstants.letterSpacing,
                    ),
                  ),
                  SizedBox(
                    height: UiConstants.personNameAndPositionSizeBoxHeight,
                  ),
                  Text(
                    UiConstants.developersPosition,
                    style: TextStyle(
                      fontSize: UiConstants.positionFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      letterSpacing: UiConstants.letterSpacing,
                    ),
                  ),
                  Divider(
                    height: UiConstants.dividerHeight,
                    thickness: UiConstants.dividerThickness,
                    color: Colors.blueAccent.shade100,
                    indent: UiConstants.dividerIndentStart,
                    endIndent: UiConstants.dividerIndentEnd,
                  ),
                  Card(
                    color: Colors.black12,
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          top: UiConstants.iconsTopPadding,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                      ),
                      title: Text(UiConstants.kevinPhoneNumber),
                      subtitle: Text(
                        UiConstants.cellPhoneText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: UiConstants.phoneAndEmailSizeBoxHeight,
                  ),
                  Card(
                    color: Colors.black12,
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          top: UiConstants.iconsTopPadding,
                        ),
                        child: Icon(
                          Icons.email,
                          color: Colors.redAccent,
                        ),
                      ),
                      title: Text(
                        UiConstants.kevinEmail,
                      ),
                      subtitle: Text(
                        UiConstants.emailText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

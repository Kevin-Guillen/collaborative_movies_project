import '../../utils/ui_constants.dart';
import 'package:flutter/material.dart';

class HoracioCard extends StatelessWidget {
  HoracioCard({
    this.blurRadius = UiConstants.blurRadius,
    this.spreadRadius = UiConstants.spreadRadius,
    this.circleAvatarRadius = UiConstants.circleAvatarRadius,
    this.titleFontSize = UiConstants.titleFontSize,
    this.subtitleFontSize = UiConstants.subtitleFontSize,
    this.letterSpacing = UiConstants.letterSpacing,
    this.cardSubtitleFontSize = UiConstants.cardSubtitleFontSize,
    this.sizedBoxHeight = UiConstants.sizedBoxHeight,
    this.sizedBoxWidth = UiConstants.sizedBoxWidth,
    this.dividerThickness = UiConstants.dividerThickness,
    this.dividerIndent = UiConstants.dividerIndent,
    this.dividerEndIndent = UiConstants.dividerEndIndent,
  });

  final double blurRadius;
  final double spreadRadius;
  final double circleAvatarRadius;
  final double titleFontSize;
  final double subtitleFontSize;
  final double letterSpacing;
  final double cardSubtitleFontSize;
  final double sizedBoxHeight;
  final double sizedBoxWidth;
  final double dividerThickness;
  final double dividerIndent;
  final double dividerEndIndent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UiConstants.horacioCardTitle,
      home: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.yellow,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UiConstants.horizontalPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: blurRadius,
                          color: Colors.black,
                          spreadRadius: spreadRadius,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        UiConstants.horacioImage,
                      ),
                      radius: circleAvatarRadius,
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Text(
                    UiConstants.horacioFullName,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: blurRadius,
                          color: Colors.black,
                          offset: Offset(
                            0.0,
                            -2.0,
                          ),
                        ),
                        Shadow(
                          blurRadius: blurRadius,
                          color: Colors.lightGreen,
                          offset: Offset(
                            5.0,
                            -5.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Text(
                    UiConstants.developersPosition,
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      letterSpacing: letterSpacing,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: blurRadius,
                          color: Colors.black,
                          offset: Offset(
                            0.0,
                            -2.0,
                          ),
                        ),
                        Shadow(
                          blurRadius: blurRadius,
                          color: Colors.lightGreen,
                          offset: Offset(
                            5.0,
                            -5.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: sizedBoxHeight,
                    thickness: dividerThickness,
                    indent: dividerIndent,
                    endIndent: dividerEndIndent,
                    color: Colors.black54,
                  ),
                  Card(
                    color: Colors.lightGreen,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                      ),
                      title: Text(
                        UiConstants.horacioPhone,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        UiConstants.pressAndCallMe,
                        style: TextStyle(
                          fontSize: cardSubtitleFontSize,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Card(
                    color: Colors.lightGreen,
                    child: ListTile(
                      leading: Icon(
                        Icons.email_outlined,
                      ),
                      title: Text(
                        UiConstants.horacioEmail,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        UiConstants.orSendMeAnEmail,
                        style: TextStyle(
                          fontSize: cardSubtitleFontSize,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

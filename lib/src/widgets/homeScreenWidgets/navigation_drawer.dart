import 'package:flutter/material.dart';
import '../../ui/presentation_cards/brian_card.dart';
import '../../ui/presentation_cards/horacio_card.dart';
import '../../ui/presentation_cards/kevin_card.dart';
import '../../utils/ui_constants.dart';
import '../../widgets/homeScreenWidgets/drawer_profiles.dart';
import '../../widgets/homeScreenWidgets/profile_card.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List _profilesList = [];

  _loadProfiles() {
    _profilesList.add(
      Profile(
        name: UiConstants.kevinFullName,
        urlImage: UiConstants.kevinImage,
        widget: KevinCard(),
      ),
    );
    _profilesList.add(
      Profile(
        name: UiConstants.brianFullName,
        urlImage: UiConstants.brianImage,
        widget: BrianCard(),
      ),
    );
    _profilesList.add(
      Profile(
        name: UiConstants.horacioFullName,
        urlImage: UiConstants.horacioImage,
        widget: HoracioCard(),
      ),
    );
  }

  @override
  void initState() {
    _loadProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Color.fromARGB(
            255,
            224,
            18,
            102,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: UiConstants.drawerContentTopPadding,
                ),
                child: Container(
                  height: UiConstants.drawerHeaderContainerHeight,
                  child: Text(
                    UiConstants.drawerHeaderText,
                    style: TextStyle(
                      fontSize: UiConstants.drawerHeaderTextFontSize,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: UiConstants.drawerDividerThickness,
                indent: UiConstants.drawerDividerIndent,
                endIndent: UiConstants.drawerDividerEndIndent,
              ),
              ListView.builder(
                itemCount: _profilesList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProfileCard(
                    profile: _profilesList[index],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: UiConstants.drawerBackButtonTopPadding,
                ),
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: UiConstants.drawerBackButtonRadius,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(
                        255,
                        224,
                        18,
                        102,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

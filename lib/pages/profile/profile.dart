import 'package:flutter/material.dart';
import 'package:moti/pages/lets_in/lets_in_page.dart';
import 'package:moti/pages/profile/profile_page.dart';

import '../../services/db_service.dart';
import '../../utils/keys.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool? bl;

  @override
  void initState() {
    super.initState();
    final key = Keys.instance;
    final db = DBService.instance;
    String? data;
    db.store(key.token, null).then((value) {
      db.receive<String>(key.token).then((value) {
        print(value);
        data = value;
        bl = data != null;
        print('bui');
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return bl == null
        ? Container(
            color: Colors.white,
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive(),
          )
        : bl!
            ? const ProfilePage()
            : LetsInPage();
  }
}

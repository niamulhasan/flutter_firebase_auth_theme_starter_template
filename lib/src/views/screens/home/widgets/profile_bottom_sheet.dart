import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../../../config/colors_themes.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: MyColors.primary,
              backgroundImage: NetworkImage("https://picsum.photos/200/300"),
            ),
            title: Text("Set Name"),
            subtitle: Text(
              "+8801818899945",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(TernavIcons.bold.edit_square),
          ),
          Divider(),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed("/login");
              },
              child: Text("Logout")),
          TextButton(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     const Text('Modal BottomSheet'),
      //     ElevatedButton(
      //       child: const Text('Close BottomSheet'),
      //       onPressed: () => Navigator.pop(context),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         FirebaseAuth.instance.signOut();
      //       },
      //       child: Text("Logout"),
      //     )
      //   ],
      // ),
    );
  }
}

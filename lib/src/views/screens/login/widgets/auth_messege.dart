import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/colors_themes.dart';
import '../../../../providers/auth_provider.dart';

class AuthMessege extends StatelessWidget {
  const AuthMessege({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, authMessege, child) =>
          authMessege.getMessege() == "null"
              ? Text("")
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "${authMessege.getMessege()}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: MyColors.primaryDeep,
                        borderRadius: BorderRadius.circular(16.0)),
                  ),
                ),
    );
  }
}

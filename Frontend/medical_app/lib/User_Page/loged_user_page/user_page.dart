import 'package:flutter/material.dart';
import 'package:medical_app/models/user_model/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? username;
  Future<Null> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    
    for (UserAccount user in User.users) {
      if (user.email == prefs.getString('userEmail')) {
        setState(() {
          username = "${user.firstName} ${user.lastName}";
        });
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Text("hello ${username??'unknow'}")
      ],
    );
  }
}

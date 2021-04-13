import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetask_app/Animation/Fadeanimation.dart';
import 'package:firetask_app/terminal.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Myreg extends StatefulWidget {
  @override
  _MyregState createState() => _MyregState();
}

class _MyregState extends State<Myreg> {
  var x = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Shimmer.fromColors(
          period: Duration(milliseconds: 1500),
          baseColor: Color(0xff82EEFD),
          highlightColor: Colors.blue,
          child: Text(
            "REGISTER",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                    1,
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/firebase.jpg'))),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeAnimation(
                          1.2,
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                hintText: ("Enter the email"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.4,
                          TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              hintText: ("Enter password"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.6,
                          Material(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 10,
                            child: MaterialButton(
                              minWidth: 200,
                              height: 40,
                              onPressed: () async {
                                try {
                                  var user =
                                      await x.createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  print(email);
                                  print(password);
                                  print(user);

                                  if (user.additionalUserInfo.isNewUser ==
                                      true) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Terminal();
                                    }));
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Text("Submit"),
                            ),
                          )),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

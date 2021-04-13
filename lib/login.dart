import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetask_app/signup.dart';
import 'package:firetask_app/terminal.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firetask_app/Animation/Fadeanimation.dart';

class Mylog extends StatefulWidget {
  @override
  _MylogState createState() => _MylogState();
}

class _MylogState extends State<Mylog> {
  var x = FirebaseAuth.instance;
  String email;
  String password;
  bool sspin = false;

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
              "LOGIN",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: sspin,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Container(
                    height: 300,
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
                                  child: Text("Login"),
                                  onPressed: () async {
                                    setState(() {
                                      sspin = true;
                                    });

                                    try {
                                      var user =
                                          await x.signInWithEmailAndPassword(
                                              email: email, password: password);
                                      print(user);
                                      if (user != null) {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: Terminal(),
                                                type: PageTransitionType.fade));
                                        setState(() {
                                          sspin = false;
                                        });
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  }),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        FadeAnimation(
                            1.8,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Not Registerd ?',
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: Myreg(),
                                            type: PageTransitionType.fade));
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

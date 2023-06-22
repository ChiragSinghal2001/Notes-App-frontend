import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/login_page.dart';
import 'package:get/get.dart';
import 'package:notes_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    List image = ["g.png", "t.png", "f.png"];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/signup.png"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.2,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 40.0,
                    backgroundImage: AssetImage("img/profile1.png"),
                  )
                ],
              ),
            ),
            Container(
              width: w,
              margin: EdgeInsets.only(left: 20.0, right: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.08,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        prefixIcon:
                            Icon(Icons.email, color: Colors.deepOrangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ]),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password,
                            color: Colors.deepOrangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                bool signupSuccess = await authProvider.signup(
                  email: emailController.text.toString(),
                  password: passwordController.text.toString(),
                );

                if (signupSuccess) {
                  // Route to welcome page upon successful login
                  Get.off(() => LoginPage());
                }
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage("img/loginbtn.png"), fit: BoxFit.cover),
                ),
                child: Center(
                  child: Text('Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.2,
            ),
            RichText(
              text: TextSpan(
                text: "Have a account?",
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
                children: [
                  TextSpan(
                      text: " SignIn",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => LoginPage());
                          // print("hARRY");
                        }),
                ],
              ),
            ),
            SizedBox(
              height: w * 0.05,
            ),
            RichText(
                text: TextSpan(
              text: "SignUp using one of the following methods",
              style: TextStyle(color: Colors.grey, fontSize: 17.0),
            )),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("img/" + image[index]),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

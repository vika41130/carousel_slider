import 'package:flutter/material.dart';
import 'package:lutoi/model/login.model.dart';
import 'package:lutoi/routing/router.dart';

class LoginPage extends StatefulWidget {
  @override
  _StateLoginPage createState() {
    return _StateLoginPage();
  }
}

class _StateLoginPage extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle errorStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 12.0, color: Colors.red);
  bool formSubmitted = false;
  LoginModel loginModel = new LoginModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      onChanged: (value) {
        setState(() {
          loginModel.email = value;
        });
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      onChanged: (value) {
        setState(() {
          loginModel.password = value;
        });
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          // Navigator.pushNamed(context, RoutingConfig.HOME);
          // Navigator.pushNamedAndRemoveUntil(context, RoutingConfig.HOME, (route) => true);
          // Navigator.pushReplacement(context, newRoute);
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) => object),
          //     (r) => false
          // );
          setState(() {
            formSubmitted = true;
          });
          if (loginModel.checkValidate()) {
            Navigator.of(context).pushReplacementNamed(RoutingConfig.HOME);
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Lut Toi'),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 155.0,
                //   child: Image.asset(
                //     "assets/logo.png",
                //     fit: BoxFit.contain,
                //   ),
                // ),
                SizedBox(height: 45.0),
                emailField,
                (formSubmitted && !loginModel.checkEmail()) ? 
                SizedBox(
                  height: 20,
                  child: Text(
                    'This field is required.',
                    style: errorStyle,
                  ),
                ) : SizedBox(),
                SizedBox(height: 25.0),
                passwordField,
                (formSubmitted && !loginModel.checkPassword()) ? 
                SizedBox(
                  height: 20,
                  child: Text(
                    'This field is required.',
                    style: errorStyle,
                  ),
                ) : SizedBox(),
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

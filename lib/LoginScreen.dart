import 'package:flutter/material.dart';
import 'package:flutter_app_six/DashboardScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
          tooltip: "Customer Support",
          onPressed: (){
          displaySnackbar("Call to our customer support : 1800 1234 1234");
      }),

      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Here"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            // Login Image,
            Image.asset(
              "images/login.png",
              width: 80,
              height: 180,
              fit: BoxFit.fill,
            ),

            // Input Field for Username,

            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: "Enter your username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            // Input Field for Password,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            // Login Button
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  onPressed: () {
                    //print("Login button is clicked");
                    validateInputFields();
                  }),
            )
          ],
        ),
      ),
    );
  }

  void validateInputFields() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty) {
      print("Please enter username");
      displaySnackbar("Please enter username");
    } else if (password.isEmpty) {
      print("Please enter password");
      displaySnackbar("Please enter password");
    } else {
      performLogin(username, password);
    }
  }

  void performLogin(String username, String password) {
    if (username == "chetu" && password == "12345") {
      // Move to DashboardScreen
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return DashboardScreen();
      }));
    } else {
      print("Invalid username or password");
      displayAlertDialog("Alert !", "Invalid username or password");
    }
  }

  void displaySnackbar(String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      action: SnackBarAction(label: "Ok", onPressed: () {}),
    );
    //Scaffold.of(context).showSnackBar(snackBar);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void displayAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        RaisedButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}

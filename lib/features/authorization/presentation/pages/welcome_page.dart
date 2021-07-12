import 'package:flutter/material.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _obscureText = true;

  String _userNameNullTracker = '';
  String _passwordNameNullTracker = '';
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: _size.width,
        height: _size.height,
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Text('English(United State)'),
            SizedBox(
              height: _size.height * 0.2,
            ),
            Text(
              'Instagram',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: _size.width,
              height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.grey.shade300,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _userNameNullTracker = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Phone number, email or username',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: _size.width,
              height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Colors.grey),
                color: Colors.grey.shade300,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _passwordNameNullTracker = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child:
                        _obscureText ? Icon(Icons.lock_open) : Icon(Icons.lock),
                  ),
                ),
                obscureText: _obscureText,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: LoginProceedButton(
                disableButton: !(_userNameNullTracker.isNotEmpty &&
                    _passwordNameNullTracker.isNotEmpty),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot your login details?',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                Text(
                  'Get help logggin in.',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15, left: 20.0),
                    child: Divider(),
                  ),
                ),
                Text('OR'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 20.0),
                    child: Divider(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: LoginProceedButton(
                disableButton: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.face,
                      color: Colors.white,
                    ),
                    Text(
                      'Log in as @username',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Divider(),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\' have an account?',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                Text(
                  'Sign up.',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}

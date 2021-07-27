import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/custom_radio_button.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';

enum RecoveryMethod { phoneNumber, email }

class RecoverAccountPage extends StatefulWidget {
  @override
  _RecoverAccountPageState createState() => _RecoverAccountPageState();
}

class _RecoverAccountPageState extends State<RecoverAccountPage> {
  var _value = RecoveryMethod.phoneNumber;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          splashColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            size: 35,
          ),
        ),
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/selfie_test.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  YMargin(25.0),
                  Text(
                    'Help Us Recover Your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23.0),
                  ),
                  YMargin(20.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            'You\'ll need to verify your identity so we can recover your account ',
                        style: TextStyle(
                          color: darkModeOn ? Colors.white : Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'zaraki',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkModeOn ? Colors.white : Colors.black,
                            ),
                          ),
                          TextSpan(
                              text:
                                  '. If you don\'t recognize this username, we can help change it back after you secure your account. How would you like to receive your security code?',
                              style: TextStyle(
                                  color:
                                      darkModeOn ? Colors.white : Colors.black))
                        ]),
                  ),
                  YMargin(25.0),
                  Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent),
                    child: ListTile(
                        onTap: () {},
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                        subtitle: Text(
                          '+234 ... ... ..26',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkModeOn ? Colors.white : Colors.black),
                        ),
                        trailing: CustomRadioButton<RecoveryMethod>(
                          value: RecoveryMethod.phoneNumber,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        )),
                  ),
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.all(0.0),
                      title: Text(
                        'Email',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      subtitle: Text(
                        'ads.....67@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: darkModeOn ? Colors.white : Colors.black,
                        ),
                      ),
                      trailing: CustomRadioButton<RecoveryMethod>(
                        value: RecoveryMethod.email,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Divider(
              color: darkModeOn ? Colors.grey.shade700 : Colors.grey.shade500,
            ),
            YMargin(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: LoginProceedButton(
                disableButton: false,
                child: Text(
                  'Send Security Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            YMargin(10),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
              ),
              onPressed: () {},
              child: Text(
                'I can\'t access this email or phone number',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            YMargin(5.0)
          ],
        ),
      ),
    );
  }
}

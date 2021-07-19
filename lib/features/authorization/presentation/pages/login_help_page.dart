import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';

class LoginHelpPage extends StatefulWidget {
  @override
  _LoginHelpPageState createState() => _LoginHelpPageState();
}

class _LoginHelpPageState extends State<LoginHelpPage> {
  bool _disable = true;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: _size.width,
          height: _size.height,
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      'Login help',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'Find your account',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'Enter your username or the email address or phone number linked to your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: _size.width,
                      height: 50.0,
                      //margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: darkModeOn
                              ? AppColors.darkStoryGrey
                              : Colors.grey.shade400,
                        ),
                        color: darkModeOn
                            ? AppColors.darkStoryGrey
                            : Colors.grey.shade100,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              _disable = false;
                            } else {
                              _disable = true;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: '@213189821',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    LoginProceedButton(
                      disableButton: _disable,
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Divider(
                              color: darkModeOn
                                  ? Colors.grey.shade700
                                  : Colors.grey.shade500,
                            ),
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkModeOn ? Colors.grey : Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Divider(
                              color: darkModeOn
                                  ? Colors.grey.shade700
                                  : Colors.grey.shade500,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            //color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Log In With Facebook',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Need more help?',
                  style:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

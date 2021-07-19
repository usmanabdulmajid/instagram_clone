import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  String _userNameNullTracker = '';
  String _passwordNameNullTracker = '';
  Language _selectedDropdownLanguage = Languages.korean;
  Language _selectedDialogLanguage = Languages.korean;
  final String defaultLocale = Platform.localeName;

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: EdgeInsets.all(0.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select your language'),
                onValuePicked: (Language language) => setState(() {
                      _selectedDialogLanguage = language;
                      print(_selectedDialogLanguage.name);
                      print(_selectedDialogLanguage.isoCode);
                    }),
                itemBuilder: _buildDialogItem)),
      );
  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }

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
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              InkWell(
                onTap: _openLanguagePickerDialog,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_selectedDialogLanguage.name),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
              // LanguagePickerDropdown(
              //   initialValue: Languages.korean,
              //   itemBuilder: _buildDialogItem,
              //   onValuePicked: (Language language) {
              //     _selectedDropdownLanguage = language;
              //     print(_selectedDropdownLanguage.name);
              //     print(_selectedDropdownLanguage.isoCode);
              //   },
              // ),
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _passwordNameNullTracker = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                        obscureText: _obscureText,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: _obscureText
                          ? FaIcon(
                              FontAwesomeIcons.eyeSlash,
                              size: 16,
                              color: Colors.grey,
                            )
                          : FaIcon(
                              FontAwesomeIcons.eye,
                              size: 16,
                              color: Colors.blue,
                            ),
                    ),
                    SizedBox(
                      width: 10.0,
                    )
                  ],
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
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                    'Forgot your loginpage details?',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  Text(
                    'Get help loggin in.',
                    style: TextStyle(
                      color: darkModeOn
                          ? AppColors.storyGrey
                          : Colors.blue.shade900,
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
                      child: Divider(
                        color: darkModeOn
                            ? Colors.grey.shade700
                            : Colors.grey.shade100,
                      ),
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkModeOn ? Colors.grey : Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 20.0),
                      child: Divider(
                        color: darkModeOn
                            ? Colors.grey.shade700
                            : Colors.grey.shade100,
                      ),
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
                      FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Continue as as @username',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Divider(
                color: darkModeOn ? Colors.grey.shade700 : Colors.grey.shade100,
              ),
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
                      color: darkModeOn
                          ? AppColors.storyGrey
                          : Colors.blue.shade900,
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
      ),
    );
  }
}

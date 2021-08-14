import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';

class LoginWithFaceBookPage extends StatefulWidget {
  @override
  _LoginWithFaceBookPageState createState() => _LoginWithFaceBookPageState();
}

class _LoginWithFaceBookPageState extends State<LoginWithFaceBookPage> {
  // String _userNameNullTracker = '';
  // String _passwordNameNullTracker = '';
  // Language _selectedDropdownLanguage = Languages.korean;
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
          XMargin(ksmallSpace),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
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
            Spacer(
              flex: 2,
            ),
            CustomIcon(
              icon: "Instagram_logo",
              size: 200,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(kmediumSpace),
              child: LoginProceedButton(
                disableButton: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                    XMargin(5),
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
            Padding(
              padding: const EdgeInsets.all(kmediumSpace),
              child: Text(
                'Madara Uchiha, Minato Namikaze, Zabuza and 611 other friends are using instagram',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15, left: 20),
                    child: Divider(
                        color: darkModeOn ? Colors.grey.shade700 : Colors.grey),
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
                    margin: EdgeInsets.only(left: 15, right: 20),
                    child: Divider(
                      color: darkModeOn ? Colors.grey.shade700 : Colors.grey,
                    ),
                  ),
                )
              ],
            ),
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
            Spacer(),
            Divider(
              color: Colors.grey.shade700,
            ),
            YMargin(ksmallSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                Text(
                  'Log in.',
                  style: TextStyle(
                    color:
                        darkModeOn ? AppColors.storyGrey : Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
            YMargin(15)
          ],
        ),
      ),
    );
  }
}

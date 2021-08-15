import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';

class AddNumberPage extends StatefulWidget {
  @override
  _AddNumberPageState createState() => _AddNumberPageState();
}

class _AddNumberPageState extends State<AddNumberPage> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _countryCode = 'NG';
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text(
          'Phone number',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: _size.width,
        height: _size.height,
        padding: EdgeInsets.only(top: 30.0, right: 16, left: 16),
        child: Column(
          children: [
            Text(
              'Enter your phone number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            YMargin(30),
            //country code dropdown textfield
            Container(
              width: _size.width,
              height: 50.0,
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: darkModeOn
                      ? AppColors.darkStoryGrey
                      : Colors.grey.shade400,
                ),
                color:
                    darkModeOn ? AppColors.darkStoryGrey : Colors.grey.shade100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CountryCodePicker(
                    padding: EdgeInsets.all(0.0),
                    onChanged: (CountryCode countryCode) {
                      setState(() {
                        _countryCode = countryCode.code;
                      });
                    },
                    backgroundColor:
                        darkModeOn ? AppColors.black : AppColors.white,
                    barrierColor:
                        darkModeOn ? AppColors.black : AppColors.white,
                    dialogBackgroundColor:
                        darkModeOn ? AppColors.black : AppColors.white,
                    dialogTextStyle: TextStyle(
                      color: darkModeOn ? AppColors.white : AppColors.black,
                    ),
                    builder: (CountryCode countrycode) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(countrycode.code,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                          XMargin(2),
                          Text(
                            countrycode.dialCode,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.expand_more,
                            color: Colors.grey,
                          )
                        ],
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: VerticalDivider(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      // autofocus: true,

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            YMargin(30),
            LoginProceedButton(
              child: Text(
                'Next',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
              disableButton: _textEditingController.text.isEmpty,
            ),
            YMargin(15),
            Text(
              'You may receive SMS updates from instagram and can opt out any time',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

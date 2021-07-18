import 'package:flutter/material.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';
import 'package:country_code_picker/country_code_picker.dart';

class NumberSignUp extends StatefulWidget {
  @override
  _NumberSignUpState createState() => _NumberSignUpState();
}

class _NumberSignUpState extends State<NumberSignUp> {
  TextEditingController _textEditingController;
  FocusNode focusNode;

  String _countryCode = 'NG';
  void showCountryCodeDialoge() => showDialog(
      context: context,
      builder: (context) {
        return CountryCodePicker(
          onChanged: (CountryCode countryCode) {},
          showOnlyCountryWhenClosed: false,
          showFlagDialog: false,
          showFlagMain: false,
        );
      });
  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {});
    });
    // focusNode = FocusNode();
    // focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    // focusNode.unfocus();
    // focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: _size.width,
              height: 50.0,
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.grey.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(
                  //   _countryCode,
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  CountryCodePicker(
                    padding: EdgeInsets.all(0.0),

                    onChanged: (CountryCode countryCode) {
                      setState(() {
                        _countryCode = countryCode.code;
                      });
                    },

                    // showOnlyCountryWhenClosed: false,
                    // showFlagDialog: false,
                    // showFlagMain: false,
                    // showCountryOnly: true,

                    //showDropDownButton: true,
                    showFlag: true,
                    //dd
                    builder: (CountryCode countrycode) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(countrycode.code,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(countrycode.dialCode,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      );
                    },
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: VerticalDivider()),
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
                  _textEditingController.text.isNotEmpty
                      ? IconButton(
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _textEditingController.clear();
                          },
                        )
                      : Container(),
                ],
              )),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'You may receive SMS updates from instagram and can opt out any time',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.0,
          ),
          LoginProceedButton(
            child: Text('Next'),
            disableButton: _textEditingController.text.isEmpty,
          )
        ],
      ),
    );
  }
}

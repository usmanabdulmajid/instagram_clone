import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/authorization/presentation/widgets/login_proceed_button.dart';

class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  TextEditingController _textEditingController;
  FocusNode focusNode;
  bool _disable = true;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    focusNode = FocusNode();
    focusNode.unfocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: _size.width,
          height: 50.0,
          padding: EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color:
                  darkModeOn ? AppColors.darkStoryGrey : Colors.grey.shade400,
            ),
            color: darkModeOn ? AppColors.darkStoryGrey : Colors.grey.shade100,
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
            // focusNode: focusNode,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Email',
              border: InputBorder.none,
            ),
          ),
        ),
        YMargin(15),
        LoginProceedButton(
          child: Text(
            'Next',
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
          disableButton: _disable,
        )
      ],
    );
  }
}

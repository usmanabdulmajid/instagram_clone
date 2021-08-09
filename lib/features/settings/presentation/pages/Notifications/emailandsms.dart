import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';

class EmailAndSMS extends StatefulWidget {
  const EmailAndSMS({Key key}) : super(key: key);

  @override
  _EmailAndSMSState createState() => _EmailAndSMSState();
}

class _EmailAndSMSState extends State<EmailAndSMS> {
  bool _isFeedBack = false;
  bool _isReminder = false;
  bool _isProduct = false;
  bool _isNews = false;
  bool _isSupport = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email and SMS'),
      ),
      body: Padding(
        padding: EdgeInsets.all(ksmallSpace),
        child: Column(
          children: [
            Tile(
                label: "Feedback Emails",
                subtitle: "Give Feedback on instagram",
                trailingWidget: Switch(
                  value: _isFeedBack,
                  onChanged: (value) {
                    setState(() {
                      _isFeedBack = !_isFeedBack;
                    });
                    value = _isFeedBack;
                  },
                  activeColor: Colors.blueAccent,
                )),
            Tile(
                label: "Reminder Emails",
                subtitle: "Get notification you may have missed.",
                trailingWidget: Switch(
                  value: _isReminder,
                  onChanged: (value) {
                    setState(() {
                      _isReminder = !_isReminder;
                    });
                    value = _isReminder;
                  },
                  activeColor: Colors.blueAccent,
                )),
            Tile(
                label: "Product Emails",
                subtitle: "Get tips about instagram tools. ",
                trailingWidget: Switch(
                  value: _isProduct,
                  onChanged: (value) {
                    setState(() {
                      _isProduct = !_isProduct;
                    });
                    value = _isProduct;
                  },
                  activeColor: Colors.blueAccent,
                )),
            Tile(
                label: "News Emails",
                subtitle: "Learn about new Istagram features.",
                trailingWidget: Switch(
                  value: _isNews,
                  onChanged: (value) {
                    setState(() {
                      _isNews = !_isNews;
                    });
                    value = _isNews;
                  },
                  activeColor: Colors.blueAccent,
                )),
            Tile(
                label: "Support Emails",
                subtitle:
                    "Get updates on reports and violation of our Community Guidelines.",
                trailingWidget: Switch(
                  value: _isSupport,
                  onChanged: (value) {
                    setState(() {
                      _isSupport = !_isSupport;
                    });
                    value = _isSupport;
                  },
                  activeColor: Colors.blueAccent,
                )),
          ],
        ),
      ),
    );
  }
}

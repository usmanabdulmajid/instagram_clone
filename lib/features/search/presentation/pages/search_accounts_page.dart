import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class SearchAccount extends StatefulWidget {
  const SearchAccount({Key key}) : super(key: key);

  @override
  _SearchAccountState createState() => _SearchAccountState();
}

class _SearchAccountState extends State<SearchAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.symmetric(
                vertical: kmediumSpace, horizontal: ksmallSpace),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).unselectedWidgetColor,
                  radius: 30,
                ),
                XMargin(ksmallSpace),
                Column(
                  children: [
                    Text("joshua_l"),
                    Text("joshua_l"),
                  ],
                )
              ],
            )),
        itemCount: 10,
      ),
    );
  }
}

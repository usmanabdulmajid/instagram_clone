import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/Tile.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key key}) : super(key: key);

  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kmediumSpace),
          child: Column(
            children: [
              Tile(label: "Personal Information"),
              Tile(label: "Your Activity"),
              Tile(label: "Saved"),
              Tile(label: "Close Friends"),
              Tile(label: "Language"),
              Tile(label: "Captions"),
              Tile(label: "Browser Settings"),
              Tile(label: "Limit Sensitive Content"),
              Tile(label: "Contact Syncing"),
              Tile(label: "Sharing to Other Apps"),
              Tile(label: "Cellular Data Use"),
              Tile(label: "Original Posts"),
              Tile(label: "Request Verification"),
              Tile(label: "Post You\'ve Liked"),
              Tile(label: "Recently Deleted"),
              Tile(label: "Branded Content"),
              YMargin(ksmallSpace),
              Tile(
                label: "Switch to Professional Account",
                color: Colors.blue,
              ),
              YMargin(ksmallSpace),
              Tile(
                label: "Add New Professional Account",
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

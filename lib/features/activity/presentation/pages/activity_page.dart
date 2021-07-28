import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/features/activity/data/models/activitymodel.dart';
import 'package:instagram_clone/features/activity/presentation/widgets/activityTile.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Activity> activities;
  @override
  void initState() {
    activities = getActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    var _size = MediaQuery.of(context).size;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkModeOn ? AppColors.black : AppColors.white,
        elevation: 0.0,
        title: Text(
          'Activity',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: _size.width,
        height: _size.height,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: activities.length,
          itemBuilder: (context, index) {
            return ActivityTile(
              timeframe: activities[index].timeframe,
              activity: activities[index].activity,
              suggestedActivity: activities[index].suggestedActivity,
              followers: activities[index].followers,
              suggestedFollower: activities[index].suggestedFollower,
              isFollowing: activities[index].isFollowing,
              hasCurrentStatusUpdate: activities[index].hasCurrentStatusUpdate,
            );
          },
        ),
      ),
    );
  }
}

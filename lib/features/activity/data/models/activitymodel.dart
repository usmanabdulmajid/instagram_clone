class Activity {
  final String timeframe;
  final String activity;
  final String suggestedActivity;
  final List<String> followers;
  final String suggestedFollower;
  final bool isFollowing;
  final DateTime dateTime;
  final bool hasCurrentStatusUpdate;

  Activity(
      {this.timeframe,
      this.activity,
      this.suggestedActivity,
      this.followers,
      this.suggestedFollower,
      this.isFollowing,
      this.dateTime,
      this.hasCurrentStatusUpdate});
}

List<Activity> getActivities() {
  List<Activity> activities = [];
  Activity activity = Activity(
    timeframe: '6 w',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Terri John', 'Deku Hans'],
    suggestedFollower: 'Vicent',
    isFollowing: false,
    dateTime: DateTime(2021, 6, 7, 9, 30),
    hasCurrentStatusUpdate: true,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '3 w',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Dexter', 'Bakugo'],
    suggestedFollower: 'Tom Hanks',
    isFollowing: true,
    dateTime: DateTime(2021, 7, 1, 9, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '4 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hatake', 'Momoshi'],
    suggestedFollower: 'Haku',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 4, 9, 30),
    hasCurrentStatusUpdate: true,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '1 d',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Frank', 'Loki'],
    suggestedFollower: 'Thor',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 27, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '6 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hisoka', 'Iruma'],
    suggestedFollower: 'Hiruzen',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 22, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '3 w',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Dexter', 'Bakugo'],
    suggestedFollower: 'Tom Hanks',
    isFollowing: true,
    dateTime: DateTime(2021, 7, 1, 9, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '4 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hatake', 'Momoshi'],
    suggestedFollower: 'Haku',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 4, 9, 30),
    hasCurrentStatusUpdate: true,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '1 d',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Frank', 'Loki'],
    suggestedFollower: 'Thor',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 27, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '6 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hisoka', 'Iruma'],
    suggestedFollower: 'Hiruzen',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 22, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '3 w',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Dexter', 'Bakugo'],
    suggestedFollower: 'Tom Hanks',
    isFollowing: true,
    dateTime: DateTime(2021, 7, 1, 9, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '4 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hatake', 'Momoshi'],
    suggestedFollower: 'Haku',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 4, 9, 30),
    hasCurrentStatusUpdate: true,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '1 d',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Frank', 'Loki'],
    suggestedFollower: 'Thor',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 27, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '6 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hisoka', 'Iruma'],
    suggestedFollower: 'Hiruzen',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 22, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '3 w',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Dexter', 'Bakugo'],
    suggestedFollower: 'Tom Hanks',
    isFollowing: true,
    dateTime: DateTime(2021, 7, 1, 9, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '4 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hatake', 'Momoshi'],
    suggestedFollower: 'Haku',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 4, 9, 30),
    hasCurrentStatusUpdate: true,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '1 d',
    activity: 'followed',
    suggestedActivity: 'see their post',
    followers: ['Frank', 'Loki'],
    suggestedFollower: 'Thor',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 27, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  activity = Activity(
    timeframe: '6 d',
    activity: 'Since you follow',
    suggestedActivity: 'you might like',
    followers: ['Hisoka', 'Iruma'],
    suggestedFollower: 'Hiruzen',
    isFollowing: false,
    dateTime: DateTime(2021, 7, 22, 12, 30),
    hasCurrentStatusUpdate: false,
  );
  activities.add(activity);
  return activities;
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/icons.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/search/presentation/widgets/share_profile_tile.dart';

Future buildShareModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: true,
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 0.95,
          builder: (context, scrollController) => CustomScrollView(
            controller: scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
                leading: SizedBox(),
                backgroundColor: Theme.of(context).accentColor,
                leadingWidth: 0,
                title: Container(
                  alignment: Alignment.center,
                  height: ksmallSpace * 2 + 4,
                  child: Container(
                    width: 35,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Theme.of(context)
                          .unselectedWidgetColor
                          .withOpacity(0.2),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(
                    Sizing.xMargin(context, 100),
                    Sizing.yMargin(context, 14),
                  ),
                  child: Container(
                    color: Theme.of(context).accentColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YMargin(ksmallSpace / 2),
                        Padding(
                          padding: const EdgeInsets.all(ksmallSpace),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: Sizing.xMargin(context, 12),
                                    width: Sizing.xMargin(context, 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.teal[900],
                                    ),
                                    // child: Image.asset(
                                    //   "assets/images/selfie_test.jpg",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  XMargin(kmediumSpace),
                                  Flexible(
                                    child: Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Write a message...",
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              YMargin(kmediumSpace),
                              Padding(
                                padding:
                                    const EdgeInsets.all(ksmallSpace * 1.25),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: ksmallSpace * 1.5,
                                        horizontal: ksmallSpace,
                                      ),
                                      height: kmediumSpace * 2.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .unselectedWidgetColor
                                            .withOpacity(0.1),
                                      ),
                                      child: TextField(
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              bottom: ksmallSpace * 1.5),
                                          border: InputBorder.none,
                                          prefixIcon: CustomIcon(
                                            icon: "search",
                                            color: Colors.grey,
                                          ),
                                          hintText: "Search",
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) => index == 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kmediumSpace + ksmallSpace,
                          ),
                          color: Theme.of(context).accentColor,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.cyan[900],
                                    radius: klargeIconSize - 4,
                                  ),
                                  XMargin(ksmallSpace),
                                  Text(
                                    "Add post to story",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                              YMargin(ksmallSpace),
                              Row(
                                children: [
                                  Container(
                                    width: klargeIconSize * 1.75,
                                    alignment: Alignment.center,
                                    child: ClipOval(
                                      child: Container(
                                        height: klargeIconSize * 1.5,
                                        width: klargeIconSize * 1.5,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            transform:
                                                GradientRotation(5.49778715),
                                            colors: [
                                              Colors.blueAccent,
                                              Colors.lightBlueAccent,
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: ClipOval(
                                            child: Container(
                                              color:
                                                  Theme.of(context).accentColor,
                                              height:
                                                  (klargeIconSize * 1.5) - 4,
                                              width: (klargeIconSize * 1.5) - 4,
                                              child: Icon(
                                                Icons.group_add_outlined,
                                                color: Colors.blueAccent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  XMargin(ksmallSpace),
                                  Text(
                                    "Create Group",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                              YMargin(ksmallSpace),
                            ],
                          ),
                        )
                      : Container(
                          color: Theme.of(context).accentColor,
                          child: ShareProfileTile(selector: false)),
                  childCount: 15,
                ),
              ),
            ],
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/colors.dart';
import 'package:instagram_clone/core/utils/sizing.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/modal_list_tile.dart';
import 'package:instagram_clone/features/settings/presentation/pages/settings_page.dart';

Future buildMenuModalBottomSheet(BuildContext context, bool darkModeOn) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        String darkIconTheme = 'assets/icons/dark-theme';
        String lightIconTheme = 'assets/icons/light-theme';
        return Container(
          height: Sizing.yMargin(context, 60),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Container(
                      width: 35,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).unselectedWidgetColor),
                    ),
                  ),
                ),
                YMargin(10),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      ModalListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Route _createSettingsRoute() {
                            return PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const Settings(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset(0.0, 0.0);
                                const curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                final offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            );
                          }

                          Navigator.push(
                            context,
                            _createSettingsRoute(),
                          );
                        },
                        label: 'Settings',
                        leadingWidget: darkModeOn
                            ? Image.asset("$darkIconTheme/settings.png")
                            : Image.asset("$lightIconTheme/settings-light.png"),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'Archive',
                        leadingWidget: darkModeOn
                            ? Image.asset("$darkIconTheme/archive.png")
                            : Image.asset("$lightIconTheme/archive-light.png"),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'Insights',
                        leadingWidget: Icon(Icons.bar_chart_outlined,
                            size: 25,
                            color:
                                darkModeOn ? AppColors.white : AppColors.black),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'Your activity',
                        leadingWidget: darkModeOn
                            ? Image.asset("$darkIconTheme/your-activity.png")
                            : Image.asset(
                                "$lightIconTheme/your-activity-light.png"),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'QR code',
                        leadingWidget: darkModeOn
                            ? Image.asset("$darkIconTheme/qrcode.png")
                            : Image.asset("$lightIconTheme/qrcode-light.png"),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'Saved',
                        leadingWidget: darkModeOn
                            ? Image.asset("$darkIconTheme/save.png")
                            : Image.asset("$lightIconTheme/save-light.png"),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'Close friends',
                        leadingWidget: darkModeOn
                            ? Image.asset("$darkIconTheme/close-friends.png")
                            : Image.asset(
                                "$lightIconTheme/close-friends-light.png"),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'Discover people',
                        leadingWidget: darkModeOn
                            ? Image.asset("$darkIconTheme/discover-people.png")
                            : Image.asset(
                                "$lightIconTheme/discover-people-light.png"),
                      ),
                      ModalListTile(
                        onTap: () {},
                        label: 'COVID-19 Information Centre',
                        leadingWidget: Icon(Icons.coronavirus_outlined,
                            size: 25,
                            color:
                                darkModeOn ? AppColors.white : AppColors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

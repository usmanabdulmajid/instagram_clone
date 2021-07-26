// import 'package:flutter/material.dart';

// Future buildoptionModalBottomSheet(BuildContext context) {
//   return showDialog(
//     barrierLabel: "Label",
//     context: context,
//     builder: (ctx) {
//       return StatefulBuilder(
//         builder: (ctx, setState) => BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//           child: Center(
//             child: Container(
//               height: Sizing.yMargin(context, 50),
//               width: Sizing.xMargin(context, 95),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 color: Theme.of(ctx).accentColor,
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(20)),
//                       color: Theme.of(ctx).accentColor,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(kmediumSpace),
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 16,
//                             backgroundColor: Colors.cyan[900],
//                           ),
//                           XMargin(ksmallSpace),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "joshua_l",
//                                 style: Theme.of(ctx).textTheme.subtitle1,
//                               ),
//                               Text(
//                                 "Los Angeles, CA",
//                                 style: Theme.of(ctx).textTheme.bodyText1,
//                               )
//                             ],
//                           ),
//                           Spacer(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ClipRect(
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           Container(
//                             color: Theme.of(context).unselectedWidgetColor,
//                             child: FittedBox(
//                               child:
//                                   Image.asset("assets/images/selfie_test.jpg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           AnimatedPositioned(
//                             duration: Duration(milliseconds: 150),
//                             curve: Curves.bounceOut,
//                             width: Sizing.xMargin(context, 95),
//                             left: 0,
//                             bottom: _showLikeTitle ||
//                                     _showOptionTitle ||
//                                     _showViewProfileTitle ||
//                                     _showShareTitle
//                                 ? 0
//                                 : -50,
//                             child: Container(
//                               color: Colors.transparent,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: kmediumSpace,
//                                     horizontal: kmediumSpace * 1.55),
//                                 child: Row(
//                                   children: [
//                                     TitlePopUp(
//                                       title: "Like",
//                                       isVisible: _showLikeTitle,
//                                     ),
//                                     Spacer(),
//                                     TitlePopUp(
//                                       title: "View Profile",
//                                       isVisible: _showViewProfileTitle,
//                                     ),
//                                     Spacer(),
//                                     TitlePopUp(
//                                       title: "Share",
//                                       isVisible: _showShareTitle,
//                                     ),
//                                     Spacer(),
//                                     TitlePopUp(
//                                       title: "Option",
//                                       isVisible: _showOptionTitle,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius:
//                           BorderRadius.vertical(bottom: Radius.circular(20)),
//                       color: Theme.of(context).accentColor,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: kmediumSpace, horizontal: kmediumSpace * 2),
//                       child: Row(
//                         children: [
//                           Listener(
//                             onPointerHover: (e) => setState(() {
//                               _showLikeTitle = true;
//                             }),
//                             onPointerUp: (e) => setState(() {
//                               _showLikeTitle = false;
//                             }),
//                             child: CustomIcon(icon: "like", size: 24),
//                           ),
//                           Spacer(),
//                           Listener(
//                             onPointerHover: (e) => setState(() {
//                               _showViewProfileTitle = true;
//                             }),
//                             onPointerUp: (e) => setState(() {
//                               _showViewProfileTitle = false;
//                             }),
//                             child: Icon(
//                               Icons.account_circle_outlined,
//                               size: 24,
//                             ),
//                           ),
//                           Spacer(),
//                           Listener(
//                             onPointerHover: (e) => setState(() {
//                               _showShareTitle = true;
//                             }),
//                             onPointerUp: (e) => setState(() {
//                               _showShareTitle = false;
//                             }),
//                             child: CustomIcon(icon: "messenger", size: 24),
//                           ),
//                           Spacer(),
//                           Listener(
//                             onPointerHover: (e) => setState(() {
//                               _showOptionTitle = true;
//                             }),
//                             onPointerUp: (e) => setState(() {
//                               _showOptionTitle = false;
//                               Navigator.of(context).pop();
//                               buildoptionModalBottomSheet(context);
//                             }),
//                             child: Icon(Icons.more_vert_rounded),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }


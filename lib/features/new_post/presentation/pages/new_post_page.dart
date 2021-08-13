import 'package:flutter/material.dart';
import 'package:instagram_clone/core/utils/constants.dart';
import 'package:instagram_clone/core/utils/sizing.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key key, @required this.close}) : super();
  final VoidCallback close;
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                size: 36,
              ),
              onPressed: widget.close,
            ),
            title: Text(
              "New Post",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.blueAccent,
                  size: 36,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: Sizing.yMargin(context, 40),
              width: Sizing.yMargin(context, 100),
              color: Colors.grey,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: Sizing.yMargin(context, 8),
              width: Sizing.yMargin(context, 100),
              color: Colors.black,
              child: Row(
                children: [
                  XMargin(ksmallSpace),
                  Row(
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(),
                      ),
                      Transform.rotate(
                          angle: 1.5708,
                          child: Icon(Icons.chevron_right_outlined)),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: const EdgeInsets.all(ksmallSpace / 2),
                    child: Padding(
                      padding: const EdgeInsets.all(ksmallSpace),
                      child: Icon(Icons.collections_outlined),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(ksmallSpace / 2),
                    child: Padding(
                      padding: const EdgeInsets.all(ksmallSpace),
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[100 * (index % 9)],
                );
              },
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: Sizing.xMargin(context, 33.33),
              mainAxisSpacing: ksmallSpace / 2,
              crossAxisSpacing: ksmallSpace / 2,
              childAspectRatio: 1.0,
            ),
          )
        ],
      ),
    );
  }
}

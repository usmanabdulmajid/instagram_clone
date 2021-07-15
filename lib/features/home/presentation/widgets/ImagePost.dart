import 'package:flutter/material.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({Key key}) : super(key: key);

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  bool _imagePageCountVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 40,
              ),
              title: Text("joshua_l"),
              subtitle: Text('data'),
              trailing: IconButton(
                color: Color(0xFFD8D8D8),
                icon: Icon(Icons.more_vert),
                onPressed: () => {},
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              setState(() {
                _imagePageCountVisible = !_imagePageCountVisible;
                Future.delayed(Duration(seconds: 5), () {
                  setState(() {
                    _imagePageCountVisible = false;
                  });
                });
              })
            },
            child: Stack(
              children: [
                Image.asset("assets/images/selfie_test.jpg"),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: _imagePageCountVisible ? 1 : 0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF121212).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        "1/2",
                        style: TextStyle(color: Color(0xFFF9F9F9)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: Icon(Icons.topic_rounded),
                    onPressed: () => {},
                  ),
                  IconButton(
                    icon: Icon(Icons.send_outlined),
                    onPressed: () => {},
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  IconButton(
                    icon: Icon(Icons.turned_in_not_rounded),
                    onPressed: () => {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Icon(Icons.account_circle),
                    Text("Liked by craig_love and 44,686 others"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                    "joshua_l The game in Japan was amazing and I want to share some photos"),
              )
            ],
          )),
        ],
      ),
    );
  }
}

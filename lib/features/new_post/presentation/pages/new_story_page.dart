import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/capture_button.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/captured_image_view.dart';
import 'package:instagram_clone/features/new_post/presentation/widgets/custom_ring.dart';

List<CameraDescription> cameras;

class NewStoryPage extends StatefulWidget {
  @override
  _NewStoryPageState createState() => _NewStoryPageState();
}

class _NewStoryPageState extends State<NewStoryPage> {
  CameraController _cameraController;
  Future<void> _initailizeCamera;
  @override
  void initState() {
    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );
    _initailizeCamera = _cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    var _size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            height: _size.height,
            child: FutureBuilder(
              future: _initailizeCamera,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.flash_off,
                    size: 30.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              //color: Colors.transparent,
              width: _size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      capturePhoto();
                    },
                    child: CaptureButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void capturePhoto() async {
    try {
      await _initailizeCamera;

      final image = await _cameraController.takePicture();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CapturedImageView(imagePath: image.path);
      }));
    } catch (e) {
      print(e);
    }
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            FutureBuilder(
              future: cameraValue,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController!);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flash_off,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.panorama_fish_eye,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flip_camera_ios,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text("Hold for video, tap for photo",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

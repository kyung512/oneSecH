// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart';

import 'package:camera/camera.dart';

class CameraRecord extends StatefulWidget {
  const CameraRecord({
    Key? key,
    this.width,
    this.height,
    this.isRecording,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool? isRecording;

  @override
  _CameraRecordState createState() => _CameraRecordState();
}

class _CameraRecordState extends State<CameraRecord> {
  CameraController? controller;
  late Future<List<CameraDescription>> _cameras;

  @override
  void initState() {
    super.initState();
    _cameras = availableCameras();
  }

  @override
  void didUpdateWidget(covariant CameraRecord oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (FFAppState().widget.isRecording &&
        !controller!.value.isRecordingVideo) {
      controller!.prepareForVideoRecording();
      controller!.startVideoRecording().then((_) {}).catchError((error) {});
    } else if (!FFAppState().widget.isRecording &&
        controller != null &&
        controller!.value.isRecordingVideo) {
      controller!.stopVideoRecording().then((file) async {
        Uint8List fileAsBytes = await file.readAsBytes();
        setState(() {
          FFAppState().widget.isRecording = false;
        });
        String dir = '/users/' + currentUserUid + '/';
        final downloadUrl = await uploadData(dir + file.path, fileAsBytes);
        FFAppState().recordVideoFBStorage = await downloadUrl ?? '';
      }).catchError((error) {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: _cameras,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            if (controller == null) {
              controller =
                  CameraController(snapshot.data![0], ResolutionPreset.max);
              controller!.initialize().then((_) {
                if (!mounted) {
                  return;
                }
                setState(() {});
              });
            }
            return controller!.value.isInitialized
                ? MaterialApp(
                    home: CameraPreview(controller!),
                  )
                : Container();
          } else {
            return Center(child: Text('No cameras available.'));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

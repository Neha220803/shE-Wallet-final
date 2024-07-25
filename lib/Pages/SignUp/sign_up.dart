// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:sample/Functions/auth.dart';
import 'package:sample/Pages/login.dart';
import 'package:sample/Utils/constants.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _locationController = TextEditingController();
final TextEditingController aadharNumberController = TextEditingController();
final TextEditingController _phoneNumberController = TextEditingController();
final FirebaseFirestore firestore = FirebaseFirestore.instance;

// UnifiedPage

class UnifiedPage extends StatefulWidget {
  const UnifiedPage({Key? key}) : super(key: key);

  @override
  _UnifiedPageState createState() => _UnifiedPageState();
}

class _UnifiedPageState extends State<UnifiedPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPlace;
  double? _selectedLat;
  double? _selectedLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Account Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: primaryColor, // Set the border color
                        )),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2.5, // Set the border thickness
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    hintText: "Enter Your Password",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2.5, // Set the border thickness
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    hintText: "Enter Your Email ID",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2.5, // Set the border thickness
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    hintText: "Enter Your Phone Number",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GooglePlaceAutoCompleteTextField(
                  textEditingController: _locationController,
                  googleAPIKey: "AIzaSyB_9c8KMY5jjb7SpDI_ESAuJzr_uKQIxIM",
                  inputDecoration: const InputDecoration(
                    hintText: "Search your location",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  debounceTime: 400,
                  countries: ["in", "fr"],
                  isLatLngRequired:
                      true, // Set to true to get latitude and longitude
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    print("Place Details - Name: ${prediction.description}");
                    print("Latitude: ${prediction.lat}");
                    print("Longitude: ${prediction.lng}");
                    _selectedLat = double.tryParse(prediction.lat ?? "");
                    _selectedLng = double.tryParse(prediction.lng ?? "");
                  },
                  itemClick: (Prediction prediction) {
                    _selectedPlace = prediction.description;
                    print("Latitude: ${prediction.lat}");
                    print("Longitude: ${prediction.lng}");

                    print(_selectedLat);
                    _locationController.text = prediction.description ?? "";
                    _locationController.selection = TextSelection.fromPosition(
                        TextPosition(
                            offset: prediction.description?.length ?? 0));
                  },
                  seperatedBuilder: const Divider(),
                  containerHorizontalPadding: 10,
                  itemBuilder: (context, index, Prediction prediction) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 7),
                          Expanded(child: Text(prediction.description ?? ""))
                        ],
                      ),
                    );
                  },
                  isCrossBtnShown: true,
                ),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // _navigateToAadharNumberPage(_selectedLat, _selectedLng);
                        // _navigateToAadharNumberPage(
                        //     double? selectedLat, double? selectedLng)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AadharNumberPage(
                              latitude: _selectedLat,
                              longitude: _selectedLng,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AadharNumberPage extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  const AadharNumberPage(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  AadharNumberPageState createState() => AadharNumberPageState();
}

class AadharNumberPageState extends State<AadharNumberPage> {
  final _formKey = GlobalKey<FormState>();
  final _aadharNumberController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isOTPEnabled = false;

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Aadhar Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _aadharNumberController,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Aadhar Number',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: primaryColor, // Dark blue color
                        width: 2.5, // Set the border thickness
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: primaryColor, // Dark blue color
                        width: 2.5, // Set the border thickness
                      ),
                    ),
                    hintText: 'Enter Your Aadhar Number',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Aadhar Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      bool isAadharValid = await verifyAadharNumber(
                          _aadharNumberController.text.trim());

                      if (isAadharValid) {
                        setState(() {
                          _isOTPEnabled = true;
                        });
                      } else {
                        _showSnackBar(context, 'Invalid Aadhar Number');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor, // White text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Send OTP',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                if (_isOTPEnabled)
                  TextFormField(
                    controller: _otpController,
                    decoration: InputDecoration(
                      labelText: 'Enter your OTP',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: primaryColor, // Dark blue color
                          width: 2.5, // Set the border thickness
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: primaryColor, // Dark blue color
                          width: 2.5, // Set the border thickness
                        ),
                      ),
                      hintText: 'Enter your OTP',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the OTP';
                      }
                      return null;
                    },
                  ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      print('Entered OTP: ${_otpController.text}');
                      signUpWithEmailAndPassword(
                          _emailController.text, _passwordController.text);
                      addUserToFirestore(
                          widget.latitude,
                          widget.longitude,
                          _nameController.text.trim(),
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          _phoneNumberController.text.trim());
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor, // White text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class FaceDetectionScreen extends StatefulWidget {
//   @override
//   _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
// }

// class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
//   CameraController? _controller;
//   FirebaseVisionImage? _image;
//   FaceDetector faceDetector = FirebaseVision.instance.faceDetector();

//   @override
//   void initState() {
//     super.initState();
//     _checkCameraPermissions(); // Check and request camera permissions
//   }

//   Future<void> _checkCameraPermissions() async {
//   PermissionStatus status = await Permission.camera.request();
//   if (status == PermissionStatus.granted) {
//     // Camera permissions granted, proceed with capturing image
//     _getImageAndDetectFaces();
//   } else {
//     // Handle the case where permissions are not granted
//     print('Camera permissions not granted.');
//   }
// }

//   void _initializeCamera() async {
//     final cameras = await availableCameras();
//     _controller = CameraController(cameras[0], ResolutionPreset.medium);
//     await _controller!.initialize();
//   }

//   Future<void> _getImageAndDetectFaces() async {
//     try {
//       final XFile image = await _controller!.takePicture();

//       setState(() {
//         _image = FirebaseVisionImage.fromFilePath(image.path);
//       });

//       final faces = await faceDetector.processImage(_image!);

//       for (Face face in faces) {
//         print('Bounding Box: ${face.boundingBox}');
//       }
//     } catch (e) {
//       print('Error detecting faces: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     faceDetector.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Photo Verification'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _controller != null
//                 ? SizedBox(
//                     width: 200.0,
//                     height: 200.0,
//                     child: CameraPreview(_controller!),
//                   )
//                 : Container(),
//             ElevatedButton(
//               onPressed: _controller != null ? _getImageAndDetectFaces : null,
//               child: Text('Capture and Detect Faces'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

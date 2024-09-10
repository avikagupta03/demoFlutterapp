import 'dart:io'; // Import this for File handling
import 'package:flutter/material.dart';
import 'profile_model.dart';
import 'package:image_picker/image_picker.dart'; // Add this for image picking

class ProfileScreenHindi extends StatefulWidget {
  final Profile profile;

  ProfileScreenHindi({required this.profile});

  @override
  _ProfileScreenHindiState createState() => _ProfileScreenHindiState();
}

class _ProfileScreenHindiState extends State<ProfileScreenHindi> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _medicalConditionController;
  late ImageProvider _profileImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _emailController = TextEditingController(text: widget.profile.email);
    _medicalConditionController =
        TextEditingController(text: widget.profile.medicalConditionStatus);
    _profileImage =
        AssetImage('assets/default_profile.png'); // Default profile image
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _profileImage = FileImage(File(image.path));
        });
      }
    } catch (e) {
      // Handle any errors from image picking
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('चित्र चयन में विफल: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('व्यक्तिगत प्रोफ़ाइल'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImage,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt,
                            color: Colors.white, size: 30),
                        onPressed: _pickImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'नाम'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'ईमेल'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _medicalConditionController,
              decoration:
              InputDecoration(labelText: 'स्वास्थ्य स्थिति'),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty &&
                      _emailController.text.isNotEmpty &&
                      _medicalConditionController.text.isNotEmpty) {
                    setState(() {
                      widget.profile.name = _nameController.text;
                      widget.profile.email = _emailController.text;
                      widget.profile.medicalConditionStatus =
                          _medicalConditionController.text;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('प्रोफ़ाइल अपडेट हो गई')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('कृपया सभी फ़ील्ड भरें')),
                    );
                  }
                },
                child: Text('सहेजें'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

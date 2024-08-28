import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class PostToInstagram extends StatefulWidget {
  @override
  _PostToInstagramState createState() => _PostToInstagramState();
}

class _PostToInstagramState extends State<PostToInstagram> {
  XFile? _selectedFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickMedia() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _selectedFile = file;
    });
  }

  void _shareToInstagram() {
    if (_selectedFile != null) {
      Share.shareXFiles([_selectedFile!], text: "Check out my post on Instagram!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post to Instagram'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_selectedFile != null)
              Image.file(
                File(_selectedFile!.path),
                height: 300,
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickMedia,
              child: Text('Pick an Image'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _shareToInstagram,
              child: Text('Share to Instagram'),
            ),
          ],
        ),
      ),
    );
  }
}

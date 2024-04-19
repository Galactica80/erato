import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PublishStoryPage extends StatefulWidget {
  @override
  _PublishStoryPageState createState() => _PublishStoryPageState();
}

class _PublishStoryPageState extends State<PublishStoryPage> {
  CollectionReference stories =
      FirebaseFirestore.instance.collection('stories');
  final _firebaseStorage = FirebaseStorage.instance;
  final _formKey = GlobalKey<FormState>();
  final _storyTitleController = TextEditingController();
  final _storyDescriptionController = TextEditingController();
  final _storyTagsController = TextEditingController();
  final _storyTextController = TextEditingController();
  bool _isEulaAccepted = false;
  String imageUrl = '';

  bool isFike = false;

  File? _imageFile;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return const Text("No file selected");
    }
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future uploadFile() async {
    if (_imageFile == null) {
      return;
    }
    var snapshot = await _firebaseStorage.ref()
        .child('images/${_imageFile!.path}')
        .putFile(_imageFile!);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
  }

  @override
  void dispose() {
    _storyTitleController.dispose();
    _storyDescriptionController.dispose();
    _storyTagsController.dispose();
    _storyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Publish a Story'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                if (_imageFile != null) Image.file(_imageFile!),
                Text("Upload Image",
                    style: Theme.of(context).textTheme.headline6),
                if (_imageFile == null)
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: () {
                        // Implement image selection logic here
                        getImageFromGallery();
                      },
                    ),
                  ),
                TextFormField(
                  controller: _storyTitleController,
                  decoration: const InputDecoration(
                    hintText: 'Story Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a story title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _storyDescriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Short Description/Synopsis',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _storyTagsController,
                  decoration: const InputDecoration(
                    hintText: 'Search Tags',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _storyTextController,
                  decoration: const InputDecoration(
                    hintText: 'Add text',
                  ),
                  maxLines: null,
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: _isEulaAccepted,
                      onChanged: (value) {
                        setState(() {
                          _isEulaAccepted = value!;
                        });
                      },
                    ),
                    const Text('I agree to EULA'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: _isEulaAccepted
                          ? () async{
                              if (_formKey.currentState!.validate()) {
                                // Implement save/publish logic here

                               await uploadFile();

                                stories
                                    .add({
                                      'title': _storyTitleController.text,
                                      'description':
                                          _storyDescriptionController.text,
                                      'tags': _storyTagsController.text,
                                      'text': _storyTextController.text,
                                      'timestamp': FieldValue.serverTimestamp(),
                                      'imageUrl': imageUrl,
                                    })
                                    .then((value) => null)
                                    .catchError((error) {
                                      debugPrint(
                                          'the story cant be published due to: ${error}');
                                    });
                              }
                            }
                          : null,
                      child: const Text('Publish'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // Set resizeToAvoidBottomInset to true
    );
  }
}

import 'dart:io';

import 'package:coffee_app/main.dart';
import 'package:coffee_app/widget/create_new_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

String postId = const Uuid().v4();

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? imageFile;
  final _nameController = TextEditingController();
  final _discriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _numberController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool isUploading = false;
  bool icLoading = false;

  void handleTakePhoto(BuildContext context) async {
    Navigator.pop(context);
    final file = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 900,
      imageQuality: 80,
    );
    if (file != null) setState(() => imageFile = File(file.path));
  }

  void handleChooseFromGallery() async {
    final file = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 675,
      maxWidth: 900,
    );
    if (file != null) setState(() => imageFile = File(file.path));
  }

  void clearImage() => setState(() => imageFile = null);

  Future<void> compressImage() async {
    final file = await imageFile!.readAsBytes();
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final decodedImage = img.decodeImage(file);
    final compressedImaga = File("$path/image$postId.jpg")
      ..writeAsBytesSync(
        img.encodeJpg(decodedImage!, quality: 85),
      );
    setState(() => imageFile = compressedImaga);
  }

  Future<String> uploadImage(imageFile) async {
    UploadTask uploadTask =
        storageRef.child("post.$postId.jpg").putFile(imageFile);
    String downloadUrl = await (await uploadTask).ref.getDownloadURL();

    return downloadUrl;
  }

  void handleSubmit() async {
    setState(() => isUploading = true);
    await compressImage();
    String mediaUrl = await uploadImage(imageFile);

    createPostInFirestore(
      category: category ?? 'xato',
      number: _numberController.text,
      mediaUrl: mediaUrl,
      description: _discriptionController.text,
      name: _nameController.text,
      cost: _costController.text,
    );
    _discriptionController.clear();
    _costController.clear();
    _numberController.clear();
    _nameController.clear();
    imageFile = null;
    isUploading = false;
    postId = const Uuid().v4();
    setState(() {});
  }

  createPostInFirestore({
    required String mediaUrl,
    required String description,
    required String name,
    required String number,
    required String cost,
    required String category,
  }) {
    foodDB.doc(postId).set({
      'postId': postId,
      'name': name,
      'description': description,
      'mediaUrl': mediaUrl,
      'cost': cost,
      'category': category,
      'number': number,
      'costnumber': 1,
    });
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CreateNewItem(
      uploading: isUploading,
      image: imageFile,
      name: _nameController,
      cost: _costController,
      number: _numberController,
      discription: _discriptionController,
      onPressed: handleChooseFromGallery,
      handleSubmit: handleSubmit,
    );
  }
}

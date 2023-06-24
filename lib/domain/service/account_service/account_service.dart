// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountService {
  changeUsername(TextEditingController usernameController) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(usernameController.text.trim());
  }

  sendResetPasswordEmail(User? user) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: '${user?.email}');
  }

  updateAccountPhoto(BuildContext context, User? user) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Reference ref =
        FirebaseStorage.instance.ref().child("${user?.uid} profilepic.jpg");
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      await ref.putFile(File(image!.path));
      ref.getDownloadURL().then((value) {
        user?.updatePhotoURL(value);
      });
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}

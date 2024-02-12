import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class Utility {
  static const String IMG_KEY = "IMAGES_KEY";
  static List<String>? curentImage = [];
  static Future<List<String>?> getImagesFromPrefrence() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(IMG_KEY);
  }

  /// save list of images to share prefrence
  static Future<bool> saveImageToShareprefrences(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? currentImages =
        await prefs.getStringList('image'); // getting current loaded images
    curentImage?.add(value.toString());
    print(' prunt function page ${currentImages}'); //add NEW IMAGE//
    return await prefs.setStringList('image', curentImage!);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Image imageFromBasic64String(String basic64String) {
    return Image.memory(
      base64Decode(basic64String),
      fit: BoxFit.fill,
    );
  }
}

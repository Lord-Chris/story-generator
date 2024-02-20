import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../models/failure.dart';
import 'i_media_service.dart';

class MediaService extends IMediaService {
  final _log = Logger();
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File?> pickImage({required bool fromGallery}) async {
    try {
      final XFile? image = await _picker.pickImage(
          source: fromGallery ? ImageSource.gallery : ImageSource.camera);
      if (image == null) return null;

      final file = File(image.path);
      return file;
    } on Exception catch (e) {
      _log.e(e);
      throw Failure(message: 'Error selecting image', data: e);
    }
  }

  @override
  Future<File?> pickVideo({required bool fromGallery}) async {
    try {
      final XFile? image = await _picker.pickVideo(
          source: fromGallery ? ImageSource.gallery : ImageSource.camera);
      if (image == null) return null;

      final file = File(image.path);
      return file;
    } on Exception catch (e) {
      _log.e(e);
      throw Failure(message: 'Error selecting video', data: e);
    }
  }
}

import 'dart:io';

abstract class IMediaService {
  Future<File?> pickImage({required bool fromGallery});
  Future<File?> pickVideo({required bool fromGallery});
  // Future<File?> getImageCropped({required File file});
}

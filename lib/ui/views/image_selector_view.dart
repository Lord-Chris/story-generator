// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_generator/models/failure.dart';
import 'package:story_generator/models/story_params.dart';
import 'package:story_generator/services/ai_service/ai_service.dart';
import 'package:story_generator/services/ai_service/i_ai_service.dart';
import 'package:story_generator/services/media_service/media_service.dart';
import 'package:story_generator/ui/views/story_view.dart';

import '../shared/_shared.dart';
import '../shared/components/general/upload_image_card.dart';

class ImageSelectorView extends StatefulWidget {
  const ImageSelectorView({super.key});

  @override
  State<ImageSelectorView> createState() => _ImageSelectorViewState();
}

class _ImageSelectorViewState extends State<ImageSelectorView> {
  final IAIService _aiService = AIService();
  File? image;
  String genre = AppConstants.genres.first;
  String length = AppConstants.storyLength.first;
  bool isBusy = false;
  String language = AppConstants.languages.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Gen', style: AppTextStyles.semiBold24),
        centerTitle: true,
      ),
      body: ScrollableColumn(
        padding: REdgeInsets.all(24),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload an image',
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.black,
            ),
          ),
          Spacing.vertSmall(),
          UploadImageCard(
            onTap: () async {
              final fromGallery = await const ImageSourceDialog().show(context);
              if (fromGallery == null) return;
              image = await MediaService().pickImage(fromGallery: fromGallery);
              setState(() {});
            },
          ),
          if (image != null)
            Container(
              width: double.maxFinite,
              margin: REdgeInsets.only(top: 16),
              padding: REdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.bidPry600, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.file(
                image!,
                fit: BoxFit.cover,
              ),
            ),
          Spacing.vertRegular(),
          AppDropdownField(
            label: 'Genre',
            hint: 'Select genre',
            items: AppConstants.genres,
            value: genre,
            onChanged: (val) => genre = val!,
          ),
          Spacing.vertRegular(),
          AppDropdownField(
            label: 'Story Length',
            hint: 'Select length',
            items: AppConstants.storyLength,
            value: length,
            onChanged: (val) => length = val!,
          ),
          Spacing.vertRegular(),
          AppDropdownField(
            label: 'Language',
            hint: 'Select language',
            items: AppConstants.languages,
            value: language,
            onChanged: (val) => language = val!,
          ),
          const Spacer(),
          Spacing.vertRegular(),
          AppButton(
            label: 'Generate Story',
            isBusy: isBusy,
            onPressed: () async {
              try {
                setState(() => isBusy = true);
                if (image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select an image')),
                  );
                  return;
                }
                final items = await _aiService.getItemsFromImage(image!);
                if (items.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'No items found in this image, please select another image.',
                      ),
                    ),
                  );
                  return;
                }

                final params = StoryParams(
                  items: items,
                  genre: genre,
                  length: length,
                  language: language,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        StoryView(image: image!, storyParams: params),
                  ),
                );
              } on IFailure catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.message)),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              } finally {
                setState(() => isBusy = false);
              }
            },
          ),
        ],
      ),
    );
  }
}

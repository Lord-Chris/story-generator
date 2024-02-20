import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:story_generator/services/media_service/media_service.dart';

import '../shared/_shared.dart';
import '../shared/components/general/upload_image_card.dart';

class ImageSelectorView extends StatefulWidget {
  const ImageSelectorView({super.key});

  @override
  State<ImageSelectorView> createState() => _ImageSelectorViewState();
}

class _ImageSelectorViewState extends State<ImageSelectorView> {
  File? image;
  String? genre;
  String? length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Gen'),
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
              image = await MediaService().pickImage(fromGallery: true);
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
            items: const [
              'Bedtime story',
            ],
            value: genre,
            onChanged: (val) => genre = val,
          ),
          Spacing.vertRegular(),
          AppDropdownField(
            label: 'Story Length',
            hint: 'Select length',
            items: const ['Long', 'Medium', 'Short'],
            value: length,
            onChanged: (val) => length = val,
          ),
          const Spacer(),
          Spacing.vertRegular(),
          AppButton(
            label: 'Generate Story',
            onPressed: () async {
              const apiKey = 'AIzaSyCYoMFaD1Y4gDVNhl9n10lhHdq9hZYEaNo';
              final image = await MediaService().pickImage(fromGallery: true);
              if (image == null) return;

              final model =
                  GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);

              const prompt = 'List the items in a imaage inside a Dart list';
              final imageBytes = await image.readAsBytes();
              final content = [
                Content.multi([
                  TextPart(prompt),
                  DataPart('image/png', imageBytes),
                ])
              ];

              final response = await model.generateContent(content);
              print(response.text);

              print('\n');

              final model2 =
                  GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
              final prompt2 =
                  'Create a bedtime story from items in this list: ${response.text}. The story should be in a Nigerian setting and should be in Pidgin english';
              final content2 = [Content.text(prompt2)];
              final response2 = await model2.generateContent(content2);
              print(response2.text);
            },
          ),
        ],
      ),
    );
  }
}

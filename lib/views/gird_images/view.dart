// Created by Adipt on 18/01/2022

import 'package:appentus_flutter/app/extensions.dart';
import 'package:appentus_flutter/data/images.dart';
import 'package:appentus_flutter/views/gird_images/widgets/image_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

part 'controller.dart';

class GridImagesPage extends ConsumerWidget {
  const GridImagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(_stateProvider);
    final controller = watch(_stateProvider.notifier);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            QAppX.router.pop();
          },
        ),
      ),
      body: (state.isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (state.gridImages.isNotEmpty)
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 20.0,
                      children: state.gridImages.map<Widget>((image) {
                        return ImageCard(image: image);
                      }).toList(),
                    ),
                  ),
                )
              : const Center(
                  child: Text('Error Fetching Images'),
                ),
    );
  }
}

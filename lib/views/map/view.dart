// Created by Adipt on 18/01/2022

import 'dart:async';

import 'package:appentus_flutter/app/extensions.dart';
import 'package:appentus_flutter/app/routing/app_router.dart';
import 'package:appentus_flutter/utils/shared_preferences.dart';
import 'package:appentus_flutter/views/gird_images/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'controller.dart';

class MapPage extends ConsumerWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(_stateProvider);
    final controller = watch(_stateProvider.notifier);
    final profile = watch(QAppX.profile.current)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: MemoryImage(
              profile.image,
            ),
          ),
        ),
        title: Text(
          profile.name,
          style: GoogleFonts.montserrat(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: controller.logout,
            child: Text(
              'Logout?',
              style: GoogleFonts.montserrat(
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: controller.initialCameraPosition,
        onMapCreated: controller.onMapCompleted,
        myLocationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToImagesPage,
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

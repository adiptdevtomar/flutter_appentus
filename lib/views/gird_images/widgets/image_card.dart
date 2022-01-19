// Created by Adipt on 19/01/2022

import 'package:appentus_flutter/data/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCard extends StatelessWidget {
  final GridImages image;

  const ImageCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl: image.downloadUrl,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Text(
          image.author,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 15.0,
          ),
        )
      ],
    );
  }
}

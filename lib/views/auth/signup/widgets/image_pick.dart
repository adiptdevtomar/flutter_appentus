// Created by Adipt on 19/01/2022

part of '../view.dart';

class ImagePick extends StatelessWidget {
  final Uint8List? image;
  final Function() onPressed;

  const ImagePick({
    Key? key,
    this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 60.0,
        child: (image == null)
            ? const Icon(
                Icons.add,
                size: 30.0,
                color: Colors.white,
              )
            : ClipOval(
                child: Image.memory(
                  image!,
                  fit: BoxFit.cover,
                  width: 120.0,
                  height: 120.0,
                ),
              ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final File? imageFile;
  final Function()? onTap;

  const UserImage({
    this.imageFile,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            height: 150,
            child: ClipRRect(
              child: imageFile == null
                  ? const Image(
                      image: AssetImage('assets/images/noimage.png'),
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      imageFile!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

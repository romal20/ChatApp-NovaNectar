/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/apis.dart';

class ProfileImage extends StatelessWidget {
  final double size;
  final String? url;

  const ProfileImage({super.key, required this.size, this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size)),
      child: CachedNetworkImage(
        width: size,
        height: size,
        fit: BoxFit.cover,
        imageUrl: url ?? APIs.user.photoURL.toString(),
        errorWidget: (context, url, error) =>
            const CircleAvatar(child: Icon(CupertinoIcons.person)),
      ),
    );
  }
}
*/
// profile_image.dart
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String url;
  final double size;

  const ProfileImage({
    Key? key,
    required this.url,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: NetworkImage(url),
      backgroundColor: Colors.transparent,
    );
  }
}

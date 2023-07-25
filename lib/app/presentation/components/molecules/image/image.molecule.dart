import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:limonfy/core/constants/colors.constants.dart';

import 'package:limonfy/app/presentation/components/atoms/images/error.image.atom.dart';
import 'package:limonfy/app/presentation/components/atoms/images/loading.image.atom.dart';

class ImageMolecule extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const ImageMolecule({
    super.key,
    required this.url,
    this.width = 50,
    this.height = 50,
    this.fit = BoxFit.scaleDown,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    if (url == '') {
      return ErrorImageAtom(
        borderRadius: borderRadius,
        width: width,
        height: height,
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: CachedNetworkImage(
            httpHeaders: const {
              "Access-Control-Allow-Headers":
                  "Access-Control-Allow-Origin, Accept"
            },
            imageUrl: url,
            imageBuilder: (BuildContext context, dynamic imageProvider) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsConstants.black.withOpacity(0.6),
                    ),
                  ),
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: fit,
                      ),
                    ),
                  ),
                ],
              );
            },
            placeholder: (BuildContext context, String url) {
              return LoadingImageAtom(
                borderRadius: borderRadius,
                width: width,
                height: height,
              );
            },
            errorWidget: (BuildContext context, String url, dynamic error) {
              return ErrorImageAtom(
                borderRadius: borderRadius,
                width: width,
                height: height,
              );
            },
          ),
        ),
      );
    }
  }
}

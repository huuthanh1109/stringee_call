import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  const ShimmerWidget.circular({
    this.width,
    this.height,
    this.shapeBorder = const CircleBorder(),
  });
  const ShimmerWidget.rectangular({this.width, this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        // period: Duration(seconds: 3),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.white60,
            shape: shapeBorder,
          ),
        ),
      );
}

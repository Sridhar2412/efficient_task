import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/theme/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkeletonWidget extends ConsumerWidget {
  const SkeletonWidget({super.key, this.height, this.width});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColor.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}

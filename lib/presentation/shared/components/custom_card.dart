import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/theme/app_color.dart';
import 'package:flutter_master/presentation/theme/app_style.dart';
import 'package:flutter_master/presentation/extensions/context.dart';
import 'package:flutter_master/presentation/extensions/widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCard extends ConsumerWidget {
  const CustomCard({super.key, required this.child, this.padding});
  final Widget child;
  final double? padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: AppStyle.shadow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child.padAll(padding ?? 10),
    );
  }
}

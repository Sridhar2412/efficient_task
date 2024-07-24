import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/theme/app_color.dart';
import 'package:flutter_master/presentation/theme/app_text_theme.dart';

class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget(
      {super.key, required this.text, this.textstyle, this.readMoreStyle});
  final String text;
  final TextStyle? textstyle;
  final TextStyle? readMoreStyle;
  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 180) {
      firstHalf = widget.text.substring(0, 180);
      secondHalf = widget.text.substring(180, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              children: <Widget>[
                Text(
                  flag ? ('$firstHalf...') : (firstHalf + secondHalf),
                  style: widget.textstyle ?? AppTextTheme.label11,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? 'show more' : 'show less',
                        style: widget.readMoreStyle ??
                            AppTextTheme.label11
                                .copyWith(color: AppColor.primary),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}

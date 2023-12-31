// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:elevo/src/ui/common/components/gap.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.onTap,
    required this.iconAssetName,
    required this.title,
    required this.color,
  }) : super(key: key);

  final void Function()? onTap;
  final String? iconAssetName;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            iconAssetName == null
                ? Container()
                : SvgPicture.asset(
                    iconAssetName!,
                    height: 25,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
            const Gap(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:asp/asp.dart';
import 'package:elevo/src/constants.dart';
import 'package:elevo/src/core/atoms/input_atoms.dart';
import 'package:elevo/src/ui/common/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputCategoryWidget extends StatelessWidget {
  const InputCategoryWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final category = context.select(() => categoryAtom.value);
    return InkWell(
      onTap: onTap,
      splashColor: kGrayColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(height: 6),
                const Text(
                  'Select the category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: kGrayColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            (category == null)
                ? IconButton(
                    onPressed: onTap,
                    color: kPrimaryColor,
                    icon: SvgPicture.asset(
                      'lib/assets/icons/arrow-down.svg',
                      height: 20,
                    ),
                  )
                : IconButton(
                    onPressed: onTap,
                    icon: CircleAvatar(
                      backgroundColor: kPrimaryColor.withOpacity(0.1),
                      child: SvgPicture.asset(categoryAtom.value!.iconPath),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
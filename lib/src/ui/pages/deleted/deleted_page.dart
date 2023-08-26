import 'package:elevo/src/constants.dart';
import 'package:elevo/src/ui/common/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeletedPage extends StatelessWidget {
  const DeletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('lib/assets/icons/trash.svg'),
            Gap(height: 20),
            Text(
              'Transaction deleted!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(height: 20),
            Text(
              'Your transaction has been\npermanently deleted.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff929292),
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(height: 25),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kPrimaryColor.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/icons/home.svg',
                      height: 20,
                    ),
                    Gap(width: 10),
                    Text(
                      'Back to Home',
                      style: TextStyle(
                        fontSize: 12,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

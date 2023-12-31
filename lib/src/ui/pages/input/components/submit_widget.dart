import 'package:elevo/src/utils/constants.dart';
import 'package:flutter/material.dart';

class SubmitWidget extends StatelessWidget {
  const SubmitWidget({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 70),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

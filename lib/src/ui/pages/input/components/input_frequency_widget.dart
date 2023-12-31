import 'package:asp/asp.dart';
import 'package:elevo/src/utils/constants.dart';
import 'package:elevo/src/core/logic/input_logic.dart';
import 'package:flutter/material.dart';

class InputFrequencyWidget extends StatelessWidget {
  const InputFrequencyWidget({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final frequencySelected = context.select(() => frequencyDataState.value);
    final frequencyLabel = mapFrequency.where((f) => f['id'] == frequencySelected).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.grey.withOpacity(0.05),
        splashColor: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Frequency",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Qanelas",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Text(
                    frequencySelected == null ? 'Daily' : frequencyLabel[0]['title'].toString(),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: "Qanelas",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 15),
                  ),
                  IconButton(
                    onPressed: onTap,
                    color: kPrimaryColor,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

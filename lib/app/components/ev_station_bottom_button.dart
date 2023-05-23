import 'package:ev_station/app/services/responsive_size.dart';
import 'package:flutter/material.dart';
import 'ev_station_button.dart';

class EvSattionBottomButton extends StatelessWidget {
  final dynamic Function() onPressed;
  final String label;
  const EvSattionBottomButton(
      {super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: 0,
          color: const Color(0xffDDE2E3),
          thickness: 1.kh,
        ),
        Padding(
          padding:
              paddingOnly(left: 20.kw, right: 20.kw, top: 9.kh, bottom: 43.kh),
          child: EvStationButton(
            onPressed: onPressed,
            label: label,
          ),
        ),
      ],
    );
  }
}

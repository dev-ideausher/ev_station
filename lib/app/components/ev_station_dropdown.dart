import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

class EvStationDropDown extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onChanged;
  final dynamic value;
  const EvStationDropDown({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          // splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          ),
      child: ButtonTheme(
        height: 48.kh,
        alignedDropdown: true,
        child: SizedBox(
          height: 49.kh,
          child: Center(
            child: DropdownButton(
              underline: Container(),
              // autovalidateMode: AutovalidateMode.always,
              style: TextStyleUtil.genSans400(
                  fontSize: 14.kh, color: const Color(0xff969696)),
              itemHeight: null,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
              ),
              // decoration: InputDecoration(
              //   contentPadding: EdgeInsets.symmetric(horizontal: 5.kw),
              //   filled: true,
              //   fillColor: Colors.white,
              //   border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(4.kh),
              //       borderSide: BorderSide(
              //           width: 0.5.kh, color: const Color(0xff9f9f9f))),
              //   enabledBorder: OutlineInputBorder(
              //       borderSide:
              //           BorderSide(width: 0.5.kh, color: const Color(0xff9f9f9f)),
              //       borderRadius: BorderRadius.circular(4.kh)),
              //   focusedBorder: OutlineInputBorder(
              //       borderSide:
              //           BorderSide(width: 0.5.kh, color: const Color(0xff9f9f9f)),
              //       borderRadius: BorderRadius.circular(4.kh)),
              // ),
              borderRadius: BorderRadius.circular(4.kh),
              iconSize: 25,
              items: items,
              onChanged: onChanged,
              value: value,
            ),
          ),
        ),
      ),
    );
  }
}

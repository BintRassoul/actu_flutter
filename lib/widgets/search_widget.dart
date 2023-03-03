import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      width: Get.width - 50,
      height: 38.5,
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      child: TextField(
        // style: TextStyle(color: color),
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintStyle: TextStyle(
            color: mainHexColor,
            height: 2.80,
            fontSize: 15,
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    controller.clear();
                    controller.value = TextEditingValue.empty;
                    //FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    height: 16.67,
                    width: 16.67,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            widget.text.isEmpty ? Colors.black : mainHexColor),
                    child: Icon(
                      Icons.close,
                      size: 9.7,
                      color: Colors.white,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          hintText: widget.hintText,
          filled: true,
          // fillColor: mainHexColor,
          prefixIcon: Icon(
            Icons.manage_search_sharp,
            size: 22,
            color: mainHexColor,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: mainHexColor.withOpacity(0.7)),
          ),
        ),
        controller: controller,

        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

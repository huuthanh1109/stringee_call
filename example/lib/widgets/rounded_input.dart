
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';

class RoundeInput extends StatefulWidget {
  final double size;
  final String title;
  final IconData icon;
  bool isPassWord = false;
  bool isDateTime = false;
  bool isPhone = false;
  final bool isNotSame;
  final dynamic controller;

  RoundeInput({
    Key key,
    this.size,
    this.icon,
    this.title,
    this.isPassWord,
    this.isDateTime,
    this.isPhone,
    this.isNotSame,
    this.controller,
  }) : super(key: key);

  @override
  _RoundeInputState createState() => _RoundeInputState();
}

class _RoundeInputState extends State<RoundeInput> {
  bool _isHidden = true;

  FocusNode _focus = FocusNode();
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocus = !isFocus;
    });
  }

  void _togglePasswordView() {
    setState(() {
      widget.isPassWord = !widget.isPassWord;
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          width: widget.size * 0.8,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isFocus ? Palette.yellow63 : Palette.textColor.withAlpha(20),
          ),
          child: TextFormField(
            focusNode: _focus,
            controller: widget.controller,
            obscureText: widget.isPassWord,
            cursorWidth: 1.5,
            cursorHeight: 20,
            maxLength: widget.isPhone ? 15 : 200,
            buildCounter: (BuildContext context,
                    {int currentLength, int maxLength, bool isFocused}) =>
                null,
            keyboardType: widget.isPhone || widget.isDateTime
                ? TextInputType.number
                : null,
            cursorColor: Palette.primaryColor,
            textInputAction:
                widget.isDateTime ? TextInputAction.done : TextInputAction.next,
            style: const TextStyle(
              color: Palette.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            onTap: () async {
              widget.isDateTime
                  ? CupertinoRoundedDatePicker.show(
                      context,
                      fontFamily: "Mali",
                      textColor: Colors.black,
                      initialDate: DateTime.now(),
                      minimumYear: 1900,
                      maximumYear: DateTime.now().year,
                      background: Colors.white,
                      borderRadius: 16,
                      initialDatePickerMode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      onDateTimeChanged: (newDateTime) {
                        setState(() {
                          widget.controller.text = DateFormat('dd/MM/yyyy')
                              .format(newDateTime)
                              .toString();
                        });
                      },
                    )
                  : null;
            },
            decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                color: Palette.textColor,
                size: 20,
              ),
              hintText: widget.title,
              hintStyle: TextStyle(
                color: Palette.textColor.withAlpha(90),
                fontSize: 14,
              ),
              border: InputBorder.none,
              suffix: widget.isPassWord
                  ? InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill,
                        size: 20,
                        color: Palette.textColor,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
        widget.isNotSame == true
            ? const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Giá trị không trùng khớp",
                    style: TextStyle(
                      color: Palette.bgColorError,
                      // fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

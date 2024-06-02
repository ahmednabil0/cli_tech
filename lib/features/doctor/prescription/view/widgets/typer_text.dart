import 'package:flutter/material.dart';
import 'package:gradution_project/core/constants/app_colors.dart';
import 'package:gradution_project/core/constants/app_const.dart';
import 'package:gradution_project/core/widgets/text.dart';

// class TypewriterText extends StatefulWidget {
//   final String text;

//   const TypewriterText({super.key, required this.text});

//   @override
//   // ignore: library_private_types_in_public_api
//   _TypewriterTextState createState() => _TypewriterTextState();
// }

// class _TypewriterTextState extends State<TypewriterText> {
//   String _displayedText = '';
//   int _charIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _startTyping();
//   }

//   void _startTyping() {
//     Future.delayed(const Duration(milliseconds: 130), () {
//       setState(() {
//         _displayedText += widget.text[_charIndex];
//         _charIndex++;
//         if (_charIndex < widget.text.length) {
//           _startTyping();
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return appText(
//       txt: _displayedText,
//       align: TextAlign.start,
//       size: AppConstants.smallText - 1,
//       fw: FontWeight.w600,
//       ml: 20,
//       color: AppColors.hintColor,
//     );

//     // Text(
//     //   _displayedText,
//     //   style: const TextStyle(
//     //     fontSize: 16.0,
//     //   ),
//     // );
//   }
// }

String formatApiResponse(Map<String, dynamic> apiResponse) {
  final sb = StringBuffer();
  for (final entry in apiResponse.entries) {
    if (entry.key.toUpperCase() == 'MEDS') {
      sb.writeln('RECOMMENDED MEDICINES:');
    } else {
      sb.writeln('${entry.key.toUpperCase()}:');
    }
    if (entry.value is String) {
      sb.writeln(' ${entry.value}');
    } else if (entry.value is List) {
      for (final item in entry.value as List) {
        sb.writeln(' ● $item');
      }
    }
    sb.writeln();
  }
  return sb.toString();
}

class TypewriterText extends StatefulWidget {
  final String text;
  final Duration typingDuration;
  final Duration pauseDuration;

  const TypewriterText({
    super.key,
    required this.text,
    this.typingDuration = const Duration(milliseconds: 50),
    this.pauseDuration = const Duration(milliseconds: 200),
  });

  @override
  TypewriterTextState createState() => TypewriterTextState();
}

class TypewriterTextState extends State<TypewriterText> {
  String _displayedText = '';
  int _charIndex = 0;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    if (_charIndex < widget.text.length) {
      if (mounted) {
        setState(() {
          _isTyping = true;
          _displayedText += widget.text[_charIndex];
          _charIndex++;
        });
      }
      Future.delayed(widget.typingDuration, () {
        _startTyping();
      });
      // _scrollToBottom();
    } else {
      if (mounted) {
        setState(() {
          _isTyping = false;
        });
      }
      Future.delayed(widget.pauseDuration, () {
        _startTyping();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return appText(
        txt: _displayedText,
        size: AppConstants.smallText,
        ml: 500,
        align: TextAlign.start,
        fw: FontWeight.w600,
        color: _isTyping ? AppColors.hintColor : AppColors.fontColor);
  }
}

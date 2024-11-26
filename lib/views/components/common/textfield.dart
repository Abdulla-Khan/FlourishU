import 'package:flourish/utils/constants/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

SizedBox textFeild(
  String name,
  TextEditingController controller, {
  int maxLines = 1,
  double height = 110,
  isEmail = false,
  isKeyboard = false,
  validator,
  onChanged,
  errorMessage,
}) {
  return SizedBox(
    height: height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 16, color: authTextColor),
        ),
        const SizedBox(height: 5),
        TextFormField(
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          keyboardType: isKeyboard
              ? TextInputType.number
              : isEmail
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          maxLines: maxLines,
          cursorColor: Colors.black,
          cursorHeight: 20,
          decoration: InputDecoration(
              errorText: errorMessage,
              errorMaxLines: 2,
              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontFamily: 'Helvetica Light',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              filled: true,
              fillColor: bgColor,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
              ),
              contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3), width: 0.8)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.3), width: 0.8)),
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.3), width: 0.8),
              )),
        ),
      ],
    ),
  );
}

class PasswordFeild extends StatefulWidget {
  const PasswordFeild(
      {super.key,
      required this.name,
      required this.controller,
      this.validator,
      this.onChanged,
      required this.errorMessage});
  final String name;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String errorMessage;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool see = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontSize: 16, color: authTextColor),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: widget.controller,
            cursorColor: Colors.black,
            cursorHeight: 20,
            decoration: InputDecoration(
              fillColor: bgColor,
              filled: true,
              contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.black)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              errorText: widget.errorMessage,
              errorMaxLines: 2,
              errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontFamily: 'Helvetica Light',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                  style: BorderStyle.solid,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.3), width: 0.8),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  see
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.black.withOpacity(0.3),
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    see = !see;
                  });
                },
              ),
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
            obscureText: see,
          ),
        ]);
  }
}

// Container descFeild(
//   String name,
//   TextEditingController controller, {
//   int maxLines = 1,
//   isEmail = false,
// }) {
//   return Container(
//     margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           name,
//           style: const TextStyle(fontSize: 16, color: Color(0xFF858597)),
//         ),
//         const SizedBox(height: 5),
//         Form(
//           autovalidateMode: AutovalidateMode.always,
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 9,
//                       spreadRadius: 4,
//                       offset: const Offset(3, 5))
//                 ]),
//             child: TextFormField(
//               controller: controller,
//               maxLines: maxLines,
//               cursorColor: Colors.black,
//               cursorHeight: 20,
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: bgColor,
//                   errorStyle: const TextStyle(fontSize: 0.01),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6),
//                     borderSide: const BorderSide(
//                       color: Colors.black,
//                       style: BorderStyle.solid,
//                     ),
//                   ),
//                   contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: BorderSide(
//                           color: Colors.black.withOpacity(0.3), width: 0.8)),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: BorderSide(
//                           color: Colors.black.withOpacity(0.3), width: 0.8)),
//                   labelStyle: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6),
//                     borderSide: BorderSide(
//                         color: Colors.black.withOpacity(0.3), width: 0.8),
//                   )),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Container countFeild(
//   String name,
//   TextEditingController controller,
//   int count, {
//   int maxLines = 1,
//   double height = 80,
//   isEmail = false,
//   isKeyboard = false,
// }) {
//   return Container(
//     height: height,
//     margin: const EdgeInsets.only(left: 24, right: 24, top: 10),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           name,
//           style:
//               TextStyle(fontSize: height / 5, color: const Color(0xFF858597)),
//         ),
//         const SizedBox(height: 5),
//         Form(
//           autovalidateMode: AutovalidateMode.always,
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.08),
//                       blurRadius: 9,
//                       spreadRadius: 4,
//                       offset: const Offset(3, 5))
//                 ]),
//             child: TextFormField(
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(count),
//               ],
//               controller: controller,
//               keyboardType: isKeyboard
//                   ? TextInputType.number
//                   : isEmail
//                       ? TextInputType.emailAddress
//                       : TextInputType.text,
//               maxLines: maxLines,
//               cursorColor: Colors.black,
//               cursorHeight: 20,
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: bgColor,
//                   errorStyle: const TextStyle(fontSize: 13),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6),
//                     borderSide: const BorderSide(
//                       color: Colors.black,
//                       style: BorderStyle.solid,
//                     ),
//                   ),
//                   contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: BorderSide(
//                           color: Colors.black.withOpacity(0.3), width: 0.8)),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: BorderSide(
//                           color: Colors.black.withOpacity(0.3), width: 0.8)),
//                   labelStyle: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6),
//                     borderSide: BorderSide(
//                         color: Colors.black.withOpacity(0.3), width: 0.8),
//                   )),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

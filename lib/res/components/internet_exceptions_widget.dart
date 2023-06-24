import 'package:flutter/material.dart';
import 'package:barber_app/res/colors/app_color.dart';

class InterNetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InterNetExceptionWidget({Key? key, required this.onPress})
      : super(key: key);

  @override
  State<InterNetExceptionWidget> createState() =>
      _InterNetExceptionWidgetState();
}

class _InterNetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_off,
            color: AppColor.goldenColor,
            size: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
                child: Text(
              'We are unable to show results.\nPlease check your data\nconenction.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.redColor),
            )),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                  child: Text(
                'Retry',
                style: TextStyle(color: AppColor.goldenColor),
              )),
            ),
          )
        ],
      ),
    );
  }
}

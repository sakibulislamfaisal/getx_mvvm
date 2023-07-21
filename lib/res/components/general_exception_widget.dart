import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';

class GeneralExceptionsWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionsWidget({Key? key, required this.onPress})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InternetExceptionsWidgetState createState() =>
      _InternetExceptionsWidgetState();
}

class _InternetExceptionsWidgetState extends State<GeneralExceptionsWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * .15,
          ),
          const Icon(
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'general_exception'.tr,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: height * .15,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: const BoxDecoration(color: AppColor.primaryColor),
              child: Center(
                child: Text(
                  'Retry Again!',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

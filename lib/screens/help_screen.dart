import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mukto_dhara/provider/theme_provider.dart';
import 'package:mukto_dhara/variables/color_variables.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final Size size = MediaQuery.of(context).size;

    themeProvider.changeStatusBarTheme();

    return Scaffold(
      backgroundColor: themeProvider.screenBackgroundColor(),
      appBar: AppBar(
        backgroundColor: themeProvider.appBarColor(),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon:  Icon(
              LineAwesomeIcons.times,
              color: themeProvider.appBarTitleColor(),
            )),
        centerTitle: true,
        title: Text('সহায়িকা',
            style: TextStyle(
              color: themeProvider.appBarTitleColor(),
            )),
      ),
      body: _bodyUI(size, themeProvider),
    );
  }

  Widget _bodyUI(Size size, ThemeProvider themeProvider) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.width * .04, horizontal: size.width*.04),
      child: ListView(
        children: [
          _customListTile(
              size,
              'কবিতার নাম, কবির নাম, কবিতার লাইন দিয়ে খোঁজ করুন।',
              LineAwesomeIcons.search,
              themeProvider),
          _customListTile(
              size,
              'কবির নাম দিয়ে কবিতার তালিকা দেখুন।',
              LineAwesomeIcons.alternate_feather,
              themeProvider),
          _customListTile(
              size,
              'কবিতার মূল তালিকা থেকে পছন্দের তালিকা অন্তর্ভুক্ত করতে বা পছন্দের তালিকা থেকে মুছে ফেলতে এই বাটনে ক্লিক করুন, নিচের দিকে নিশ্চিত করণ বার্তা প্রদর্শন হবে এবং বাটন পরিবর্তন হবে।',
              LineAwesomeIcons.bookmark,
              themeProvider),
          _customListTile(
              size,
              'মেনু থেকে সক্রিয় করুন Light Mode / Dark Mode.',
              LineAwesomeIcons.moon,
              themeProvider),
          _customText(size, 'পছন্দের তালিকা থেকে মুছে ফেলতে কবিতার নামটি আঙ্গুলে বায়ে ঠেলে দিন। এক্ষেত্রেও নিশ্চিত করণ বার্তা প্রদর্শন হবে।', themeProvider),
          _customText(size, '*** কবিতাটি শুধু পছন্দের তালিকা থেকে মুছে যাবে, পরবর্তী যে কোন সময় পুনরায় যুক্ত করা যাবে।', themeProvider),
          _customText(size, '*** সম্পুর্ণ কবিতা পড়ার সময় মুঠোফোন এর আলো দীর্ঘ সময় সচল থাকবে।', themeProvider),
        ],
      ),
    );
  }


  ///  custom  list tile designs
  Widget _customListTile(
      Size size, String text, IconData iconData, ThemeProvider themeProvider) {
    return ListTile(
      leading: Icon(
        iconData,
        size: size.width * .07,
        color: themeProvider.bodyIconColor(),
      ),
      title: Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: themeProvider.bodyTextColor(), fontSize: size.width * .04),
      ),
    );
  }


  /// custom text design
  Widget _customText(Size size, String text, ThemeProvider themeProvider){
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: size.width*.03, horizontal: size.width*.04),
      child: Text(

        text,
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: themeProvider.bodyTextColor(), fontSize: size.width * .04
        ),
      ),
    );
  }
}

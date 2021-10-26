import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mukto_dhara/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final Size size = MediaQuery.of(context).size;

    themeProvider.changeStatusBarTheme();
    return  Scaffold(
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
        title: Text('পছন্দের তালিকা',
            style: TextStyle(
              color: themeProvider.appBarTitleColor(),
            )),
      ),
    );
  }
}

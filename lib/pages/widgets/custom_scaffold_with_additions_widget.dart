import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:flutter/material.dart';

class CustomScaffoldWithAdditionsWidget extends StatelessWidget {
  const CustomScaffoldWithAdditionsWidget({
    super.key,
    required this.title,
    required this.body,
    this.additionalAppBarButton,
    this.appBarAdditions,
    this.leading,
  });

  final String title;
  final IconButton? additionalAppBarButton;
  final Widget? appBarAdditions;
  final Widget? leading;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.mainRed,
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 15,
          shadowColor: AppColors.mainRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 60.0),
            ),
          ),
          actions: additionalAppBarButton != null
              ? List.of(
                  [additionalAppBarButton!],
                )
              : null,
          bottom: appBarAdditions == null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: Container(),
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(120),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF242024),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(
                            MediaQuery.of(context).size.width,
                            20.0,
                          ),
                          bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width,
                            60.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 30,
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.mainWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.mainBlack,
                                  ),
                                ),
                                child: appBarAdditions),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      body: body,
    );
  }
}

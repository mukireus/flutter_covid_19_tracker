import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/app_bottombar.dart';
import 'package:covid_19_tracker_in_flutter/ui/widgets/turkey_status.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TurkeyDetailsScreen extends StatefulWidget {
  @override
  _TurkeyDetailsScreenState createState() => _TurkeyDetailsScreenState();
}

class _TurkeyDetailsScreenState extends State<TurkeyDetailsScreen> {
  final String imageUrl = "https://source.unsplash.com/1920x1080/?istanbul";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLight,
      bottomNavigationBar: AppBottomNavigationBar(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.colorDarkBlue,
              expandedHeight: MediaQuery.of(context).size.height * .32,
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
              floating: true,
              snap: true,
              pinned: true,
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                child: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(AppStrings.turkey, style: _sliverAppBarTitleStyle),
                  background: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              ),
              automaticallyImplyLeading: true,
              leading: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(context, AppStrings.pageHome)),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TurkeyStatus(),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Column(),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  TextStyle get _sliverAppBarTitleStyle => GoogleFonts.openSans(
      fontWeight: FontWeight.bold, color: Colors.white, shadows: <Shadow>[Shadow(offset: Offset(1.0, 1.0), blurRadius: 3.0, color: Colors.black)]);
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._column);

  final Column _column;
  @override
  double get minExtent => 121;
  @override
  double get maxExtent => 150;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _column,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

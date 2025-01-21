import 'package:chandrima_real_estate/common/widgets/custom_asset_image_widget.dart';
import 'package:chandrima_real_estate/features/home/screens/home_screen.dart';
import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/images.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex =_selectedIndex;
  }

  final List<Widget> _pages = [
    Homepage(),
    SizedBox(width: 20,),
    Center(child: Text('Calender', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem("${Images.home_logo}", 'Home', 0),
              _buildNavItem(Images.user_logo, 'Referral', 1),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(onPressed: (){
                    _showBottomSheet(context);
                  },
                      shape: CircleBorder(),
                      color: AppColors.blue,
                      padding: EdgeInsets.all(12),
                      child:CustomAssetImage(
                        "${Images.menu_logo}",height: 22,width: 22,color: Colors.white,
                      )
                  ),
                  SizedBox(height: 10,)
                ],
              ),

              _buildNavItem(Images.calender_icon, 'Calender', 3),
              _buildNavItem(Images.profile_icon, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }


  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.75,

          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    childrenPadding: EdgeInsets.zero,
                    title: Text('Properties',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.properties_icon}",height: 22,width: 22,color: AppColors.blue,),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(), // No decoration
                        child: ListTile(
                          onTap: (){


                          },
                          leading: SizedBox(width: 20),
                          title: Text('Off Plan Properties'),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(), // No decoration
                        child: ListTile(
                          onTap: (){


                          },
                          leading: SizedBox(width: 20),
                          title: Text('Ready to Move in'),
                        ),
                      ), Container(
                        decoration: BoxDecoration(), // No decoration
                        child: ListTile(
                          leading: SizedBox(width: 20),
                          title: Text('Secondary Market'),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Luxury Asset',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.asset_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Market Insights',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.market_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Marketing Tool',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.tools_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Professional Services',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.professional_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Tenantor',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.tenantor_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Networking & Event',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.networking_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Propadya Academy',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.propadaya_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Market Players',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.market_players_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Referral & Reward',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.user_logo}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),ExpansionTile(
                    title: Text('Support & Feedback',style: robotoMedium,),
                    leading:CustomAssetImage("${Images.support_icon}",height: 22,width: 22,),
                    children: <Widget>[
                      ListTile(title: Text('Sub Item 1')),
                      ListTile(title: Text('Sub Item 2')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildNavItem(String icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAssetImage(icon,height: 22,width: 22,),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

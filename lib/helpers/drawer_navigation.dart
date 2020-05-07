import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simplefluttertodoapp/screens/home_screen.dart';
import 'package:simplefluttertodoapp/screens/categories_screen.dart';
import 'package:simplefluttertodoapp/screens/todos_by_category.dart';
import 'package:simplefluttertodoapp/services/category_service.dart';

class DrawerNavigaton extends StatefulWidget {
  @override
  _DrawerNavigatonState createState() => _DrawerNavigatonState();
}

class _DrawerNavigatonState extends State<DrawerNavigaton> {
  List<Widget> _categoryList = List<Widget>();

  CategoryService _categoryService = CategoryService();

  @override
  initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _categoryService.readCategories();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(InkWell(
          onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new TodosByCategory(
                        category: category['name'],
                      ))),
          child: ListTile(
            title: Text(category['name']),
          ),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://flutter.dev/images/flutter-logo-sharing.png'),
              ),
              accountName:
                  Text('Abderaouf Cherafa', style: GoogleFonts.montserrat()),
              accountEmail: Text('raouforganize@gmail.com',
                  style: GoogleFonts.montserrat()),
              decoration: BoxDecoration(color: Color(0xff2b79e6)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home', style: GoogleFonts.montserrat()),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen())),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Categories', style: GoogleFonts.montserrat()),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoriesScreen())),
            ),
            Divider(),
            Column(
              children: _categoryList,
            ),
          ],
        ),
      ),
    );
  }
}

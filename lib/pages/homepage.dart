import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trell/models/categorymodels.dart';
import 'package:trell/models/dietmodels.dart';
import 'package:trell/models/popularmodels.dart';

class Homepage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModel> categories = [];
  List<Dietmodels> diets = [];
  List<Popularmodels> popular = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiet() {
    diets = Dietmodels.getDiet();
  }

  void _getPopular() {
    popular = Popularmodels.getPopular();
  }

  void modelsInfo() {
    categories = CategoryModel.getCategories();
    diets = Dietmodels.getDiet();
    popular = Popularmodels.getPopular();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDiet();
    _getPopular();
    return Scaffold(
      appBar: appBar(), // Upar wala part
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchBar(),
          SizedBox(height: 40),
          _categorysection(),
          SizedBox(height: 40),
          _dietSection(),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // ignore: sized_box_for_whitespace
              ListView.separated(
                itemCount: popular.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: popular[index].boxisSelected
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff1D1617).withOpacity(0.05),
                          offset: Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          popular[index].iconPath,
                          width: 55,
                          height: 55,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popular[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${popular[index].level} | ${popular[index].duration} | ${popular[index].calories}",
                              style: TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // TBD
                          },
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recomendations\nfor Diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15),
        // ignore: sized_box_for_whitespace
        Container(
          height: 260,
          // color: Colors.blue,
          child: ListView.separated(
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 230,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: diets[index].boxColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [SvgPicture.asset(diets[index].iconPath)]),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}",
                          style: TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewisSelected
                                ? Color(0xff92A3FD)
                                : Colors.transparent,
                            diets[index].viewisSelected
                                ? Color(0xff9DCEFF)
                                : Colors.transparent,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                            color: diets[index].viewisSelected
                                ? Colors.white
                                : Color(0xffC58BF2),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20),
          ),
        ),
      ],
    );
  }

  Column _categorysection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15),
        // ignore: sized_box_for_whitespace
        Container(
          height: 130,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                // height: 50,
                width: 100,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: categories[index].boxColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Color(0xff000000).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Search Pizza',
          hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          // ignore: sized_box_for_whitespace
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: const Color.fromARGB(255, 219, 218, 218),
                    indent: 12,
                    endIndent: 12,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 16),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,

      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            width: 24,
            height: 24,
          ),
        ),
      ),

      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              width: 5,
              height: 5,
            ),
          ),
        ),
      ],
    );
  }
}

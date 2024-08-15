import 'package:contactbooktotalx/constand/app_color.dart';
import 'package:contactbooktotalx/constand/app_fonts.dart';
import 'package:contactbooktotalx/utilis/responsive.dart';
import 'package:contactbooktotalx/widgets/Custom_search_field.dart';
import 'package:contactbooktotalx/widgets/custom_filter_screen.dart';
import 'package:contactbooktotalx/widgets/custom_textfield.dart';
import 'package:contactbooktotalx/widgets/icon_filter_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  final List<Map<String, String>> users = [
    {
      "name": "Martin Dokidis",
      "age": "34",
      "image": "assets/images/Rectangle 88 (1).png"
    },
    {
      "name": "Marilyn Rosser",
      "age": "34",
      "image": "assets/images/Rectangle 88 (2).png"
    },
    {
      "name": "Cristofer Lipshutz",
      "age": "34",
      "image": "assets/images/Rectangle 88 (3).png"
    },
    {
      "name": "Wilson Botosh",
      "age": "34",
      "image": "assets/images/Rectangle 88 (4).png"
    },
    {
      "name": "Anika Saris",
      "age": "34",
      "image": "assets/images/Rectangle 88 (5).png"
    },
    {
      "name": "Phillip Gouse",
      "age": "34",
      "image": "assets/images/Rectangle 88.png"
    },
    {
      "name": "Wilson Bergson",
      "age": "34",
      "image": "assets/images/Rectangle 88 (2).png"
    },
  ];

  UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Scaffold(
      backgroundColor: AppColors.homeBackgorund,
      appBar: AppBar(
        backgroundColor: AppColors.submitButton,
        leading: const Icon(Icons.location_pin, color: Colors.white),
        title: Text(
          'Nilambur',
          style: AppTypography.montserratSemiBold.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(responsive.wp(2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomSearchFiled(responsive: responsive),
                ),
                Container(
                  margin: EdgeInsets.only(left: responsive.wp(1)),
                  padding: EdgeInsets.all(responsive.hp(0.1)),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconFilterButton(
                    responsive: responsive,
                    onPressed: () {
                      _showSortOptions(context);
                    },
                  ),
                )
              ],
            ),
            Text(
              'Users Lists',
              style: AppTypography.montserratBoldMainHead.copyWith(
                color: AppColors.textColor.withOpacity(0.6),
                fontSize: responsive.hp(2),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: responsive.hp(1)),
                    elevation: 1,
                    child: Padding(
                      padding: EdgeInsets.all(responsive.wp(2)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(users[index]['image']!),
                          ),
                          SizedBox(width: responsive.wp(3)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  users[index]['name']!,
                                  style: AppTypography.montserratBoldMainHead
                                      .copyWith(
                                    fontSize: responsive.hp(2.2),
                                  ),
                                ),
                                Text(
                                  'Age: ${users[index]['age']}',
                                  style:
                                      AppTypography.montserratRegular.copyWith(
                                    fontSize: responsive.hp(1.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddUserDialog(context);
        },
        backgroundColor: AppColors.submitButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

void _showSortOptions(BuildContext context) {
  final responsive = context.responsive;
  String selectedValue = 'all';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(responsive.wp(4)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(responsive.wp(6)),
                topRight: Radius.circular(responsive.wp(6)),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sort',
                  style: AppTypography.montserratBoldMainHead.copyWith(
                    fontSize: responsive.hp(2.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomFilterScreen(
                  isSelected: selectedValue == 'all',
                  onPressed: () {
                    setState(() {
                      selectedValue = 'all';
                    });
                  },
                  selectedColor: AppColors.filterSelect,
                  borderColor: Colors.black.withOpacity(0.4),
                  label: 'All',
                ),
                const SizedBox(height: 20),
                CustomFilterScreen(
                  isSelected: selectedValue == 'elder',
                  onPressed: () {
                    setState(() {
                      selectedValue = 'elder';
                    });
                  },
                  selectedColor: AppColors.filterSelect,
                  borderColor: Colors.black.withOpacity(0.4),
                  label: 'Age: Elder',
                ),
                const SizedBox(height: 20),
                CustomFilterScreen(
                  isSelected: selectedValue == 'younger',
                  onPressed: () {
                    setState(() {
                      selectedValue = 'younger';
                    });
                  },
                  selectedColor: AppColors.filterSelect,
                  borderColor: Colors.black.withOpacity(0.4),
                  label: 'Age: Younger',
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void _showAddUserDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: SizedBox(
          width: 320, 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Add a new user',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/images/user (10) 1.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .blue,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                          onPressed: () {
            
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); 
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors
                              .grey, 
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .blue, 
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

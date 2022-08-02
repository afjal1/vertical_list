import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<Products> _demoProducts = [
    Products(
        'Honor 9Lite',
        'https://images-na.ssl-images-amazon.com/images/I/41z2r4ppXoL._SX220_.jpg',
        'Huawei',
        '\$1200'),
    Products(
        'Honor 10Lite',
        'https://rukminim1.flixcart.com/image/230/230/jr9iwsw0/mobile/m/s/y/honor-10-lite-hry-al00-original-imafd3hh9dyygg7f.jpeg?q=70',
        'Huawei',
        '\$1400'),
    Products(
        'Honor 20',
        'https://rukminim1.flixcart.com/image/230/230/jvtujrk0/mobile/7/r/h/honor-20-na-original-imafgh62mxw3ggvg.jpeg?q=70',
        'Huawei',
        '\$1200'),
    Products(
        'Samsung 1',
        'https://images.samsung.com/is/image/samsung/assets/in/about-us/brand/logo/mo/360_197_1.png',
        'Samsung',
        '\$1700'),
    Products(
        'Samsung 2',
        'https://images.samsung.com/is/image/samsung/assets/in/about-us/brand/logo/mo/360_197_1.png',
        'Samsung',
        '\$800'),
    Products(
        'Xiaomi 1',
        'https://1000logos.net/wp-content/uploads/2021/08/Xiaomi-logo.jpg',
        'Xiaomi',
        '\$1700'),
    Products(
        'Xiaomi 2',
        'https://1000logos.net/wp-content/uploads/2021/08/Xiaomi-logo.jpg',
        'Xiaomi',
        '\$800'),
    Products(
        'LG 1',
        'https://brandongaille.com/wp-content/uploads/2014/03/LG-Company-Logo.jpg',
        'LG',
        '\$1700'),
    Products(
        'LG  2',
        'https://brandongaille.com/wp-content/uploads/2014/03/LG-Company-Logo.jpg',
        'LG',
        '\$800'),
    Products(
        'RealMe1 ',
        'https://i.pinimg.com/originals/fc/7d/d1/fc7dd1801533e4837b23cc9928a9a615.jpg',
        'Real Me',
        '\$1700'),
    Products(
        'RealMe2',
        'https://i.pinimg.com/originals/fc/7d/d1/fc7dd1801533e4837b23cc9928a9a615.jpg',
        'Real Me',
        '\$800'),
    Products(
        'Lava1',
        'https://i.pinimg.com/originals/fc/7d/d1/fc7dd1801533e4837b23cc9928a9a615.jpg',
        'Lava',
        '\$1700'),
    Products(
        'Lava2',
        'https://i.pinimg.com/originals/fc/7d/d1/fc7dd1801533e4837b23cc9928a9a615.jpg',
        'Lava',
        '\$800'),
  ];
  final List<Category> _demoCategories = [
    const Category(
      title: 'Huawei',
      icon:
          'https://i.pinimg.com/originals/fc/7d/d1/fc7dd1801533e4837b23cc9928a9a615.jpg',
    ),
    const Category(
      title: 'Samsung',
      icon:
          'https://images.samsung.com/is/image/samsung/assets/in/about-us/brand/logo/mo/360_197_1.png',
    ),
    const Category(
      title: 'Xiaomi',
      icon: 'https://1000logos.net/wp-content/uploads/2021/08/Xiaomi-logo.jpg',
    ),
    const Category(
      title: 'LG',
      icon:
          'https://brandongaille.com/wp-content/uploads/2014/03/LG-Company-Logo.jpg',
    ),
    const Category(
      title: 'Real Me',
      icon:
          'https://www.themobileindian.com/wp-content/uploads/2021/06/realme-logo-a.jpg',
    ),
    const Category(
      title: 'Lava',
      icon:
          'https://seekvectorlogo.net/wp-content/uploads/2019/02/lava-international-vector-logo.png',
    ),
  ];

  String _selectedCategory = 'Huawei';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: SizedBox(
              width: 1170,
              child: Row(children: [
                Container(
                  width: 100,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[200]!,
                          spreadRadius: 3,
                          blurRadius: 10)
                    ],
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _demoCategories.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _selectedCategory = _demoCategories[index].title!;
                          setState(() {});
                        },
                        child: CategoryItem(
                          title: _demoCategories[index].title!,
                          icon: _demoCategories[index].icon!,
                          isSelected:
                              _demoCategories[index].title == _selectedCategory,
                        ),
                      );
                    },
                  ),
                ),
                //list of products
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                        itemCount: _demoProducts
                            .where((element) =>
                                element.category == _selectedCategory)
                            .length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: ((context, index) {
                          List<Products> products = _demoProducts
                              .where((element) =>
                                  element.category == _selectedCategory)
                              .toList();
                          return Card(
                            color: Colors.grey[200],
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    products[index].image,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 15),
                                  Flexible(
                                    child: Text(
                                      products[index].title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    products[index].price,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                ) // )
              ]))),
    ));
  }
}

class CategoryItem extends StatelessWidget {
  final String? title;
  final String? icon;
  final bool? isSelected;

  const CategoryItem({this.title, this.icon, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        decoration: BoxDecoration(
            border: Border.all(
              color: isSelected! ? Colors.grey[200]! : Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(7),
            color:
                isSelected! ? Colors.blue[200] : Theme.of(context).cardColor),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,

                  //padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected!
                          ? Colors.amber[200]
                          : Colors.white.withOpacity(0.05)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      icon!,
                      fit: BoxFit.fill,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isSelected! ? Colors.white : Colors.black)),
                ),
              ]),
        ),
      ),
    );
  }
}

class Category {
  final String? title;
  final String? icon;

  const Category({
    this.title,
    this.icon,
  });
}

class Products {
  final String title;
  final String image;
  final String category;
  final String price;

  Products(
    this.title,
    this.image,
    this.category,
    this.price,
  );
}

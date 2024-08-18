import 'package:flutter/material.dart';
import 'package:uisampleaug16/veiw/shop_screen/shop_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List items = [
      {
        'images': 'assets/image/one.jpeg',
        'itemsName': 'Roadster',
        'price': 'INR:-15,299  #50%off'
      },
      {
        'images': 'assets/image/two.jpeg',
        'itemsName': 'rizado',
        'price': 'INR:-16,099'
      },
      {
        'images': 'assets/image/meno.webp',
        'itemsName': 'Highland',
        'price': 'INR:-22,099  #35%off'
      },
      {
        'images': 'assets/image/four.webp',
        'itemsName': 'Trumpet dress',
        'price': 'INR:-21,099  #40%off'
      },
      {
        'images': 'assets/image/three.jpeg',
        'itemsName': 'HIGHLANDER',
        'price': 'INR:-19,099  #35%off'
      },
      {
        'images': 'assets/image/ment.webp',
        'itemsName': 'Tumpetlo',
        'price': 'INR:-14,099  #40%off'
      },
      {
        'images': 'assets/image/five.webp',
        'itemsName': 'sundress',
        'price': 'INR:-12,199'
      },
      {
        'images': 'assets/image/six.webp',
        'itemsName': 'Stormborn',
        'price': 'INR:-16899'
      },
      {
        'images': 'assets/image/seven.webp',
        'itemsName': 'Ers-Stormborn',
        'price': 'INR:-12699'
      },
      {
        'images': 'assets/image/eight.jpeg',
        'itemsName': 'Shirtdress',
        'price': 'INR:-11,200'
      },
      {
        'images': 'assets/image/nine.jpeg',
        'itemsName': 'asymmetric dress',
        'price': 'INR:-14,799'
      },
      {
        'images': 'assets/image/menth.webp',
        'itemsName': 'Tpetlo',
        'price': 'INR:-10,099  #40%off'
      },
      {
        'images': 'assets/image/ten.webp',
        'itemsName': 'bokkShirt',
        'price': 'INR:-18,799'
      },
      {
        'images': 'assets/image/dd.jpeg',
        'itemsName': 'Wrap around dress',
        'price': 'INR:-16,799'
      },
      {
        'images': 'assets/image/ss.webp',
        'itemsName': 'bWrap around dress',
        'price': 'INR:-19,099'
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: const [
          Stack(
            children: [
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 35,
              ),
              Positioned(
                  right: 0,
                  top: 3,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 10,
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ))
            ],
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color(0xFF7D7C7C),
                        ),
                      ),
                      child: Row(children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Search Anything")
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.filter_list,
                      size: 20,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFF7D7C7C),
                          )),
                      child: Center(
                        child: Text(
                          "Men",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFF7D7C7C),
                          )),
                      child: Center(
                        child: Text(
                          "Women",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFF7D7C7C),
                          )),
                      child: Center(
                        child: Text(
                          "Kids",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFF7D7C7C),
                          )),
                      child: Center(
                        child: Text(
                          "T-Shirts",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFF7D7C7C),
                          )),
                      child: Center(
                        child: Text(
                          "Pants",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Color(0xFF7D7C7C),
                          )),
                      child: Center(
                        child: Text(
                          "Shirts",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6),
                  itemCount: items.length,
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Shopscreen()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              items[index]["images"]))),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Icon(Icons.favorite_outline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        Text(
                          items[index]['itemsName'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        Text(
                          items[index]['price'],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.favorite_outline_rounded,
                  size: 30,
                ),
                Text(
                  "Saved",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.local_mall_outlined,
                  size: 30,
                ),
                Text(
                  "Cart",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.settings_outlined,
                  size: 30,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

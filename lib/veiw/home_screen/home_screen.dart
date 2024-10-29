import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uisampleaug16/controller/catecory_controller.dart';
import 'package:uisampleaug16/controller/home_screen_controller.dart';
import 'package:uisampleaug16/veiw/shop_screen/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CatecoryController>().getadata();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeScreenController>().getProduct();
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
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color(0xFF7D7C7C),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.search),
                            Text("Search Anything")
                          ]),
                    ),
                  ),
                  Spacer(),
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
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 80,
              //         height: 50,
              //         decoration: BoxDecoration(
              //             color: Colors.black,
              //             borderRadius: BorderRadius.circular(15)),
              //         child: Center(
              //           child: Text(
              //             "All",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.white,
              //                 fontSize: 15),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 15,
              //       ),
              //       Container(
              //         width: 80,
              //         height: 50,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(15),
              //             border: Border.all(
              //               color: Color(0xFF7D7C7C),
              //             )),
              //         child: Center(
              //           child: Text(
              //             "Men",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 15),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 15,
              //       ),
              //       Container(
              //         width: 80,
              //         height: 50,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(15),
              //             border: Border.all(
              //               color: Color(0xFF7D7C7C),
              //             )),
              //         child: Center(
              //           child: Text(
              //             "Women",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 15),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 15,
              //       ),
              //       Container(
              //         width: 80,
              //         height: 50,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(15),
              //             border: Border.all(
              //               color: Color(0xFF7D7C7C),
              //             )),
              //         child: Center(
              //           child: Text(
              //             "Kids",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 15),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Consumer<CatecoryController>(
                    builder: (context, catecoryObj, child) => Row(
                      children: List.generate(
                        4,
                        (index) => Container(
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
                              catecoryObj.catecoryList[index].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Consumer<HomeScreenController>(
                  builder: (context, providerObj, child) => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6),
                    itemCount: providerObj.homemodellist!.length,
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
                                          builder: (context) => Shopscreen(
                                                imageUrl: providerObj
                                                    .homemodellist![index].image
                                                    .toString(),
                                                Title: providerObj
                                                    .homemodellist![index].title
                                                    .toString(),
                                                Des: providerObj
                                                    .homemodellist![index]
                                                    .description
                                                    .toString(),
                                                Price: providerObj
                                                    .homemodellist![index].price
                                                    .toString(),
                                              )),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(providerObj
                                                .homemodellist![index].image
                                                .toString()))),
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
                                        borderRadius:
                                            BorderRadius.circular(12)),
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
                            providerObj.homemodellist![index].title.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          Text(
                            providerObj.homemodellist![index].price.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

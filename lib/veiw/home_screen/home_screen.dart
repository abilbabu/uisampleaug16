import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      (timeStamp) async {      
        await context.read<HomeScreenController>().getCategory();
        await context.read<HomeScreenController>().getProduct();          
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Consumer<HomeScreenController>(
          builder: (context, homeController, child) => homeController.isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _buildSreachBox(),
                        SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: InkWell(
                                  onTap: () {
                                    homeController.onCategorySelection(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            homeController.selectedIndexCategory ==
                                                    index
                                                ? Colors.black
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Color(0xFF7D7C7C),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Text(
                                        homeController.catecoryList[index]
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: homeController
                                                        .selectedIndexCategory ==
                                                    index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: homeController.isProductloading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 0.6),
                                  itemCount: homeController.productList.length,
                                  itemBuilder: (context, index) => Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  if(homeController.productList[index].id !=null){
                                                    Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Shopscreen(
                                                              productId: homeController.productList[index].id!,
                                                            )),
                                                  );
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: NetworkImage(
                                                              homeController
                                                                  .productList[
                                                                      index]
                                                                  .image
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
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Icon(
                                                      Icons.favorite_outline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8)),
                                        Text(
                                          homeController
                                              .productList[index].title
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8)),
                                        Text(
                                          "Price:-${homeController.productList[index].price.toString()}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: const Color(0xFF1C1C1C)),
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
        ));
  }

  Widget _buildSreachBox() {
    return Row(
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
                children: [Icon(Icons.search), Text("Search Anything")]),
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
              color: Colors.black, borderRadius: BorderRadius.circular(12)),
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Discover",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      actions: const [
        Stack(
          children: [
            Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
              size: 30,
            ),
            Positioned(
                right: 0,
                top: 3,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 7,
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ))
          ],
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}

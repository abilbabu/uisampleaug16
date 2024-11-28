import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uisampleaug16/controller/cart_screen_controller.dart';
import 'package:uisampleaug16/veiw/cart_screen/payment_screen/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Consumer<CartScreenController>(
        builder: (context, CartController, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    CartController.storedProducts.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Container(
                        height: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(CartController
                                                    .storedProducts[index]
                                                ["image"]),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          CartController.storedProducts[index]
                                              ["title"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "\$ ${CartController.storedProducts[index]["price"].toString()}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            await CartController.incrementQty(
                                              currentQty: CartController
                                                  .storedProducts[index]["qty"],
                                              id: CartController
                                                  .storedProducts[index]["id"],
                                            );
                                          },
                                          child: Text("+")),
                                      Text(CartController.storedProducts[index]
                                              ["qty"]
                                          .toString()),
                                      ElevatedButton(
                                          onPressed: () {
                                            CartController.decrementQty(
                                                currentQty: CartController
                                                        .storedProducts[index]
                                                    ["qty"],
                                                id: CartController
                                                        .storedProducts[index]
                                                    ["id"]);
                                          },
                                          child: Text("-"))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () async {
                                  await CartController.removeProduct(
                                      CartController.storedProducts[index]
                                          ["id"]);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Amount:-",
                            style: TextStyle(
                                color: const Color(0xFFC1C1C1),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          Text(
                            "\$ ${CartController.totalCartvalue.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_test_1DP5mmOlF5G5ag',
                          'theme.color': "#219B9D",
                          'amount': "${CartController.totalCartvalue * 100}",
                          'name': 'Acme Corp.',
                          'description': 'Fine T-Shirt',
                          'retry': {'enabled': true, 'max_count': 1},
                          'send_sms_hash': true,
                          'timeout': 120,
                          'prefill': {
                            'contact': '8888888888',
                            'email': 'test@razorpay.com'
                          },
                          'external': {
                            'wallets': ['paytm']
                          }
                        };
                        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                            handlePaymentErrorResponse);
                        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                            handlePaymentSuccessResponse);
                        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                            handleExternalWalletSelected);
                        razorpay.open(options);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14)),
                        child: Row(
                          children: [
                            Text(
                              "CHECKOUT",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    // showAlertDialog(
    //     context, "Payment Successful", "Payment ID: ${response.paymentId}");
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentScreen(),
        ));
    context.read<CartScreenController>().cleardata();
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

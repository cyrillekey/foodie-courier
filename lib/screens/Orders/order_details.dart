import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/order_provider.dart';
import 'package:foodie_courier/models/order_model.dart';
import 'package:foodie_courier/screens/DeliveryMap/delivery_directions.dart';
import 'package:foodie_courier/screens/widgets/Alerts.dart';
import 'package:foodie_courier/screens/widgets/progress_inidcator.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OrderDetails extends StatefulWidget {
  final String order_id;
  const OrderDetails({Key? key, required this.order_id}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool isFinish = false;
  bool isSuccess = false;
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false)
        .getSingleOrder(widget.order_id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Consumer<OrderProvider>(builder: (context, orderProvider, child) {
        Order currentOrder = orderProvider.current_order!;
        var date = DateTime.parse(currentOrder.order_date);
        return orderProvider.isLoading == true
            ? const CustomIndicator()
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: [
                              const Text(
                                "Order Id:",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "#${currentOrder.order_id}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          Wrap(
                            children: [
                              const Icon(Icons.date_range),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${date.day}/${date.month}/${date.year}",
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Wrap(
                        children: [
                          Text(
                            "Item${currentOrder.productOrder.length > 1 ? 's' : ''}:",
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${currentOrder.productOrder.length}",
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.43,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: currentOrder.productOrder.length,
                          itemBuilder: (context, index) => productItem(
                              currentOrder.productOrder[index].food!.food_name,
                              currentOrder.productOrder[index].food!.food_price,
                              currentOrder.productOrder[index].food!.food_image,
                              currentOrder.productOrder[index].quantity,
                              date)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Location",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("lorem1 jj"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("lorem1")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Delivery Cost",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Kes ${currentOrder.delivery_cost}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(252, 126, 87, 1.0)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SwipeableButtonView(
                        onFinish: () {
                          if (isSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        DeliveryLocation())));
                          } else {
                            Alert.showCustomSnackbar(
                                context, "Order Already Booked",
                                isSuccess: false);
                          }
                          setState(() {
                            isFinish = false;
                          });
                        },
                        isFinished: isFinish,
                        onWaitingProcess: () async {
                          bool result =
                              await orderProvider.acceptOrder(widget.order_id);
                          setState(() {
                            setState(() {
                              isFinish = true;
                              isSuccess = result;
                            });
                          });
                        },
                        activeColor: const Color.fromRGBO(252, 126, 87, 1.0),
                        buttonWidget:
                            const Icon(Icons.keyboard_double_arrow_right_sharp),
                        buttonText: "Swipe to accept order"),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
      }),
    );
  }

  Widget productItem(String productName, double productPrice, String imageLink,
      int quantity, DateTime date) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(imageLink)),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        productName,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Wrap(
                      children: [
                        const Text(
                          "Quantity:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$quantity",
                          style: const TextStyle(
                              color: Color.fromRGBO(252, 126, 87, 1.0),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "Order at ${date.hour}:${date.minute} hrs",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Amount",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Kes ${productPrice * quantity}",
                      style: const TextStyle(
                          color: Color.fromRGBO(252, 126, 87, 1.0),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

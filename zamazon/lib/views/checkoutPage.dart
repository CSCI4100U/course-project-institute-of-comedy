import 'package:flutter/material.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';
import 'package:zamazon/models/userModel.dart';
import 'package:zamazon/widgets/buildCheckOutItem.dart';
import 'package:zamazon/widgets/confirmPurchase.dart';
import 'package:zamazon/models/CusUser.dart';

class CheckOutPage extends StatelessWidget {
  CheckOutPage({
    super.key,
    this.title,
    required this.checkOutItems,
    required this.sumOfCart,
    required this.numOfItems,
  });

  final String? title;
  final List<ShoppingCartWishListItem> checkOutItems;
  final double sumOfCart;
  final int numOfItems;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: CusUser(),
      stream: UserModel().getUserInformation(),
      builder: (context, snapshot) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text(title!),
            iconTheme: Theme.of(context).iconTheme,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).primaryColor,
            elevation: 0,
          ),
          body: (snapshot.data!.name != 'Default')
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: checkOutItems.length,
                      itemBuilder: (context, index) {
                        return BuildCheckOutItem(
                            scwlItem: checkOutItems[index]);
                      }),
                )
              : const Center(child: CircularProgressIndicator()),
          bottomNavigationBar: (snapshot.data!.name != 'Default')
              ? ConfirmPurchaseWidget(
                  checkedOutItems: checkOutItems,
                  sumOfCart: sumOfCart,
                  width: MediaQuery.of(context).size.width,
                  user: snapshot.data as CusUser,
                  numOfItems: numOfItems,
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

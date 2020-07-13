import 'dart:math';
import 'package:fusion_shop/src/config/MyCart.dart';
import 'package:fusion_shop/src/model/ebayItems.dart';
import 'package:flutter/material.dart';
import 'package:fusion_shop/src/themes/light_color.dart';
import 'package:fusion_shop/src/themes/theme.dart';
import 'package:fusion_shop/src/widgets/customtitle.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key key}) : super(key: key);

  Widget cartItems(List<Product> products) {
    return Column(children: products.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.network(
                  model.displayStockPhotos
                      ? model.stockPhotoUrl
                      : 'https://www.teknozeka.com/wp-content/uploads/2020/03/wp-header-logo-21.png',
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: CustomTitleText(
                    text: model.title,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      CustomTitleText(
                        text: '\$ ',
                        color: AppColors.red,
                        fontSize: 12,
                      ),
                      CustomTitleText(
                        text: Random().nextInt(100).toString(),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey.withAlpha(150),
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomTitleText(
                      text: 'x1',
                      fontSize: 12,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomTitleText(
          text: ' Items',
          color: AppColors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        CustomTitleText(
          text: '\$',
          fontSize: 18,
        ),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppColors.orange,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: AppTheme.fullWidth(context) * .4,
          child: CustomTitleText(
            text: 'Submit',
            color: AppColors.background,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<MyCart>(context);
    return products == null || products.getItems.length == 0
        ? Center(
            child: Text('Cart is empty'),
          )
        : Container(
            padding: AppTheme.padding,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  cartItems(products.getItems),
                  Divider(
                    thickness: 1,
                    height: 70,
                  ),
                  price(),
                  SizedBox(height: 30),
                  submitButton(context),
                ],
              ),
            ),
          );
  }
}

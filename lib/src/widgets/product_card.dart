import 'package:fusion_shop/src/model/category.dart';
import 'package:flutter/material.dart';
import 'package:fusion_shop/src/themes/light_color.dart';
import 'package:fusion_shop/src/themes/theme.dart';
import 'package:fusion_shop/src/widgets/customtitle.dart';

class ProductCard extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;
  ProductCard({Key key, this.model, this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: model.isSelected
                    ? AppColors.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected ? AppColors.orange : AppColors.grey,
                  width: model.isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model.image != null ? Image.asset(model.image) : SizedBox(),
                  model.name == null
                      ? Container()
                      : Container(
                          child: CustomTitleText(
                            text: model.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                ],
              ),
            ),
          );
  }
}

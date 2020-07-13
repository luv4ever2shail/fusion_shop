// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);
//https://app.quicktype.io/

import 'dart:convert';

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    this.timestamp,
    this.ack,
    this.build,
    this.version,
    this.approximatePages,
    this.moreResults,
    this.pageNumber,
    this.product,
    this.totalProducts,
  });

  DateTime timestamp;
  String ack;
  String build;
  String version;
  int approximatePages;
  bool moreResults;
  int pageNumber;
  List<Product> product;
  int totalProducts;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        timestamp: DateTime.parse(json["Timestamp"]),
        ack: json["Ack"],
        build: json["Build"],
        version: json["Version"],
        approximatePages: json["ApproximatePages"],
        moreResults: json["MoreResults"],
        pageNumber: json["PageNumber"],
        product:
            List<Product>.from(json["Product"].map((x) => Product.fromJson(x))),
        totalProducts: json["TotalProducts"],
      );

  Map<String, dynamic> toJson() => {
        "Timestamp": timestamp.toIso8601String(),
        "Ack": ack,
        "Build": build,
        "Version": version,
        "ApproximatePages": approximatePages,
        "MoreResults": moreResults,
        "PageNumber": pageNumber,
        "Product": List<dynamic>.from(product.map((x) => x.toJson())),
        "TotalProducts": totalProducts,
      };
}

class Product {
  Product({
    this.detailsUrl,
    this.displayStockPhotos,
    this.productId,
    this.itemSpecifics,
    this.stockPhotoUrl,
    this.title,
  });

  String detailsUrl;
  bool displayStockPhotos;
  List<ProductId> productId;
  ItemSpecifics itemSpecifics;
  String stockPhotoUrl;
  String title;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        detailsUrl: json["DetailsURL"],
        displayStockPhotos: json["DisplayStockPhotos"],
        productId: List<ProductId>.from(
            json["ProductID"].map((x) => ProductId.fromJson(x))),
        itemSpecifics: ItemSpecifics.fromJson(json["ItemSpecifics"]),
        stockPhotoUrl: json["StockPhotoURL"],
        title: json["Title"],
      );

  Map<String, dynamic> toJson() => {
        "DetailsURL": detailsUrl,
        "DisplayStockPhotos": displayStockPhotos,
        "ProductID": List<dynamic>.from(productId.map((x) => x.toJson())),
        "ItemSpecifics": itemSpecifics.toJson(),
        "StockPhotoURL": stockPhotoUrl,
        "Title": title,
      };
}

class ItemSpecifics {
  ItemSpecifics({
    this.nameValueList,
  });

  List<NameValueList> nameValueList;

  factory ItemSpecifics.fromJson(Map<String, dynamic> json) => ItemSpecifics(
        nameValueList: List<NameValueList>.from(
            json["NameValueList"].map((x) => NameValueList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "NameValueList":
            List<dynamic>.from(nameValueList.map((x) => x.toJson())),
      };
}

class NameValueList {
  NameValueList({
    this.name,
    this.value,
  });

  String name;
  List<String> value;

  factory NameValueList.fromJson(Map<String, dynamic> json) => NameValueList(
        name: json["Name"],
        value: List<String>.from(json["Value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Value": List<dynamic>.from(value.map((x) => x)),
      };
}

class ProductId {
  ProductId({
    this.value,
    this.type,
  });

  String value;
  String type;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        value: json["Value"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Type": type,
      };
}

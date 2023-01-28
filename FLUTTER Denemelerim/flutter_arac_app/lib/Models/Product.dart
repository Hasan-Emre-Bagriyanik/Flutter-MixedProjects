class Product {
  int? id;
  int? categoryId;
  late String productName;
  late double unitPrice;
  late int unitAge;
  late String unitImage;

  Product(this.id, this.categoryId, this.productName, this.unitAge,
      this.unitImage, this.unitPrice);

  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    unitPrice = double.tryParse(json["unitPrice"].toString())!;
    unitAge = json["unitAge"];
    unitImage = json["unitImage"];
  }

  Map? toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "unitPrice": unitPrice,
      "unitAge": unitAge,
      "unitImage": unitImage,
    };
  }
}

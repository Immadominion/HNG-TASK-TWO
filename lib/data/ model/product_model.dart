class Product {
  int? page;
  int? size;
  int? total;
  dynamic debug;
  dynamic previousPage;
  dynamic nextPage;
  List<Items>? items;

  Product({
    this.page,
    this.size,
    this.total,
    this.debug,
    this.previousPage,
    this.nextPage,
    this.items,
  });

  Product.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    total = json['total'];
    debug = json['debug'];
    previousPage = json['previous_page'];
    nextPage = json['next_page'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['size'] = size;
    data['total'] = total;
    data['debug'] = debug;
    data['previous_page'] = previousPage;
    data['next_page'] = nextPage;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  String? description;
  String? uniqueId;
  String? urlSlug;
  bool? isAvailable;
  bool? isService;
  dynamic previousUrlSlugs;
  bool? unavailable;
  dynamic unavailableStart;
  dynamic unavailableEnd;
  String? id;
  dynamic parentProductId;
  dynamic parent;
  String? organizationId;
  dynamic stockId;
  List<dynamic>? productImage;
  List<dynamic>? categories;
  String? dateCreated;
  String? lastUpdated;
  String? userId;
  List<Photos>? photos;
  dynamic prices;
  dynamic stocks;
  List<CurrentPrice>? currentPrice;
  bool? isDeleted;
  dynamic availableQuantity;
  dynamic sellingPrice;
  dynamic discountedPrice;
  dynamic buyingPrice;
  dynamic extraInfos;
  dynamic featuredReviews;
  List<dynamic>? unavailability;

  Items({
    this.name,
    this.description,
    this.uniqueId,
    this.urlSlug,
    this.isAvailable,
    this.isService,
    this.previousUrlSlugs,
    this.unavailable,
    this.unavailableStart,
    this.unavailableEnd,
    this.id,
    this.parentProductId,
    this.parent,
    this.organizationId,
    this.stockId,
    this.productImage,
    this.categories,
    this.dateCreated,
    this.lastUpdated,
    this.userId,
    this.photos,
    this.prices,
    this.stocks,
    this.currentPrice,
    this.isDeleted,
    this.availableQuantity,
    this.sellingPrice,
    this.discountedPrice,
    this.buyingPrice,
    this.extraInfos,
    this.featuredReviews,
    this.unavailability,
  });

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    uniqueId = json['unique_id'];
    urlSlug = json['url_slug'];
    isAvailable = json['is_available'];
    isService = json['is_service'];
    previousUrlSlugs = json['previous_url_slugs'];
    unavailable = json['unavailable'];
    unavailableStart = json['unavailable_start'];
    unavailableEnd = json['unavailable_end'];
    id = json['id'];
    parentProductId = json['parent_product_id'];
    parent = json['parent'];
    organizationId = json['organization_id'];
    stockId = json['stock_id'];
    productImage = json['product_image'];
    categories = json['categories'];
    dateCreated = json['date_created'];
    lastUpdated = json['last_updated'];
    userId = json['user_id'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    prices = json['prices'];
    stocks = json['stocks'];
    if (json['current_price'] != null) {
      currentPrice = <CurrentPrice>[];
      json['current_price'].forEach((v) {
        currentPrice!.add(CurrentPrice.fromJson(v));
      });
    }
    isDeleted = json['is_deleted'];
    availableQuantity = json['available_quantity'];
    sellingPrice = json['selling_price'];
    discountedPrice = json['discounted_price'];
    buyingPrice = json['buying_price'];
    extraInfos = json['extra_infos'];
    featuredReviews = json['featured_reviews'];
    unavailability = json['unavailability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['unique_id'] = uniqueId;
    data['url_slug'] = urlSlug;
    data['is_available'] = isAvailable;
    data['is_service'] = isService;
    data['previous_url_slugs'] = previousUrlSlugs;
    data['unavailable'] = unavailable;
    data['unavailable_start'] = unavailableStart;
    data['unavailable_end'] = unavailableEnd;
    data['id'] = id;
    data['parent_product_id'] = parentProductId;
    data['parent'] = parent;
    data['organization_id'] = organizationId;
    data['stock_id'] = stockId;
    data['product_image'] = productImage;
    data['categories'] = categories;
    data['date_created'] = dateCreated;
    data['last_updated'] = lastUpdated;
    data['user_id'] = userId;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['prices'] = prices;
    data['stocks'] = stocks;
    if (currentPrice != null) {
      data['current_price'] = currentPrice!.map((v) => v.toJson()).toList();
    }
    data['is_deleted'] = isDeleted;
    data['available_quantity'] = availableQuantity;
    data['selling_price'] = sellingPrice;
    data['discounted_price'] = discountedPrice;
    data['buying_price'] = buyingPrice;
    data['extra_infos'] = extraInfos;
    data['featured_reviews'] = featuredReviews;
    data['unavailability'] = unavailability;
    return data;
  }

  
}

class Photos {
  String? modelName;
  String? modelId;
  String? organizationId;
  String? filename;
  String? url;
  bool? isFeatured;
  bool? saveAsJpg;
  bool? isPublic;
  bool? fileRename;
  int? position;

  Photos({
    this.modelName,
    this.modelId,
    this.organizationId,
    this.filename,
    this.url,
    this.isFeatured,
    this.saveAsJpg,
    this.isPublic,
    this.fileRename,
    this.position,
  });

  Photos.fromJson(Map<String, dynamic> json) {
    modelName = json['model_name'];
    modelId = json['model_id'];
    organizationId = json['organization_id'];
    filename = json['filename'];
    url = json['url'];
    isFeatured = json['is_featured'];
    saveAsJpg = json['save_as_jpg'];
    isPublic = json['is_public'];
    fileRename = json['file_rename'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model_name'] = modelName;
    data['model_id'] = modelId;
    data['organization_id'] = organizationId;
    data['filename'] = filename;
    data['url'] = url;
    data['is_featured'] = isFeatured;
    data['save_as_jpg'] = saveAsJpg;
    data['is_public'] = isPublic;
    data['file_rename'] = fileRename;
    data['position'] = position;
    return data;
  }
}

class CurrentPrice {
  Map<String, List<double>>? price;

  CurrentPrice({this.price});

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    Map<String, List<double>> parsedPrice = {};
    if (json != null) {
      json.forEach((key, value) {
        List<double> priceList = [];
        if (value != null && value is List) {
          for (var price in value) {
            if (price is double) {
              priceList.add(price);
            } else if (price is int) {
              priceList.add(price.toDouble());
            } else if (price is String) {
              double? convertedPrice = double.tryParse(price);
              if (convertedPrice != null) {
                priceList.add(convertedPrice);
              }
            }
          }
        }
        parsedPrice[key] = priceList;
      });
    }
    return CurrentPrice(price: parsedPrice);
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
    };
  }
}

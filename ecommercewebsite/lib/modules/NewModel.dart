

class NewModel {
  NewModel({
      num? id, 
      String? title, 
      num? price, 
      String? description, 
      List<String>? images, 
      String? creationAt, 
      String? updatedAt, 
      Category? category,}){
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _images = images;
    _creationAt = creationAt;
    _updatedAt = updatedAt;
    _category = category;
}

  NewModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _creationAt = json['creationAt'];
    _updatedAt = json['updatedAt'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  num? _id;
  String? _title;
  num? _price;
  String? _description;
  List<String>? _images;
  String? _creationAt;
  String? _updatedAt;
  Category? _category;
NewModel copyWith({  num? id,
  String? title,
  num? price,
  String? description,
  List<String>? images,
  String? creationAt,
  String? updatedAt,
  Category? category,
}) => NewModel(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  description: description ?? _description,
  images: images ?? _images,
  creationAt: creationAt ?? _creationAt,
  updatedAt: updatedAt ?? _updatedAt,
  category: category ?? _category,
);
  num? get id => _id;
  String? get title => _title;
  num? get price => _price;
  String? get description => _description;
  List<String>? get images => _images;
  String? get creationAt => _creationAt;
  String? get updatedAt => _updatedAt;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    map['images'] = _images;
    map['creationAt'] = _creationAt;
    map['updatedAt'] = _updatedAt;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Clothes"
/// image : "https://i.imgur.com/QkIa5tT.jpeg"
/// creationAt : "2024-01-20T01:34:14.000Z"
/// updatedAt : "2024-01-20T01:34:14.000Z"

class Category {
  Category({
      num? id, 
      String? name, 
      String? image, 
      String? creationAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _creationAt = creationAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _creationAt = json['creationAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _creationAt;
  String? _updatedAt;
Category copyWith({  num? id,
  String? name,
  String? image,
  String? creationAt,
  String? updatedAt,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  creationAt: creationAt ?? _creationAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get creationAt => _creationAt;
  String? get updatedAt => _updatedAt;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['creationAt'] = _creationAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}
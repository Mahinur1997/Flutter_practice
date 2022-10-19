class Model {
  String? name;
  int? number;
  String? imgAsset;

  // First type constructor
  // Model(this.name, this.number, this.imgAsset);
  /* 2nd type constructor  */
  Model({this.name, this.number, this.imgAsset});
}

// List Class er bahire declare krte hobe
List<Model> userList = [
  Model(name: "Roman", number: 01727508023, imgAsset: "assets/images/boy1.png"),
  Model(
      name: "Suman", number: 01727508023, imgAsset: "assets/images/girl1.png"),
  Model(
      name: "Susan", number: 01727508023, imgAsset: "assets/images/girl2.jpg"),
];

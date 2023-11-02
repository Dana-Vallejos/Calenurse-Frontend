class RequestCardModel {
  final String name;
  final String lastName;

  RequestCardModel({required this.name, required this.lastName});

  static List<RequestCardModel> requestCards = [
    RequestCardModel(name: "Alicia", lastName: "Rojas"),
    RequestCardModel(name: "Julia", lastName: "Torres"),
  ];
}

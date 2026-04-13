
class TicketCategoryItem {
  int? id;
  String? name;
  String? description;


  TicketCategoryItem({this.id, this.name, this.description});

  TicketCategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }


}

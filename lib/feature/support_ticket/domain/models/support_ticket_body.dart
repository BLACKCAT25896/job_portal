class TicketBody {
  String? title;
  int? ticketCategoryId;
  String? priority;
  String? description;

  TicketBody({this.title, this.ticketCategoryId, this.priority, this.description});

  TicketBody.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    ticketCategoryId = json['ticket_category_id'];
    priority = json['priority'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['ticket_category_id'] = ticketCategoryId;
    data['priority'] = priority;
    data['description'] = description;
    return data;
  }
}

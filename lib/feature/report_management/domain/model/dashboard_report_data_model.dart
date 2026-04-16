
import 'package:mighty_job/helper/price_converter.dart';

class DashboardReportModel {
  Summary? summary;
  Wallet? wallet;
  List<OrderStatusCounts>? orderStatusCounts;
  List<OrderChart>? orderChart;
  Earnings? earnings;
  UserOverview? userOverview;
  Filters? filters;

  DashboardReportModel(
      {this.summary,
        this.wallet,
        this.orderStatusCounts,
        this.orderChart,
        this.earnings,
        this.userOverview,
        this.filters});

  DashboardReportModel.fromJson(Map<String, dynamic> json) {
    summary =
    json['summary'] != null ? Summary.fromJson(json['summary']) : null;
    wallet =
    json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    if (json['order_status_counts'] != null) {
      orderStatusCounts = <OrderStatusCounts>[];
      json['order_status_counts'].forEach((v) {
        orderStatusCounts!.add(OrderStatusCounts.fromJson(v));
      });
    }
    if (json['order_chart'] != null) {
      orderChart = <OrderChart>[];
      json['order_chart'].forEach((v) {
        orderChart!.add(OrderChart.fromJson(v));
      });
    }
    earnings = json['earnings'] != null
        ? Earnings.fromJson(json['earnings'])
        : null;
    userOverview = json['user_overview'] != null
        ? UserOverview.fromJson(json['user_overview'])
        : null;
    filters =
    json['filters'] != null ? Filters.fromJson(json['filters']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    if (orderStatusCounts != null) {
      data['order_status_counts'] =
          orderStatusCounts!.map((v) => v.toJson()).toList();
    }
    if (orderChart != null) {
      data['order_chart'] = orderChart!.map((v) => v.toJson()).toList();
    }
    if (earnings != null) {
      data['earnings'] = earnings!.toJson();
    }
    if (userOverview != null) {
      data['user_overview'] = userOverview!.toJson();
    }
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    return data;
  }
}

class Summary {
  int? totalStores;
  int? totalOrders;
  int? totalProducts;
  int? totalCustomers;
  List<LatestOrders>? latestOrders;
  List<TopProducts>? topProducts;
  List<TopProducts>? topBrands;
  List<TopProducts>? topCategories;
  List<TopCustomers>? topCustomers;
  int? totalBrands;
  int? totalCategories;

  Summary(
      {this.totalStores,
        this.totalOrders,
        this.totalProducts,
        this.totalCustomers,
        this.latestOrders,
        this.topProducts,
        this.topBrands,
        this.topCategories,
        this.topCustomers,
        this.totalBrands,
        this.totalCategories});

  Summary.fromJson(Map<String, dynamic> json) {
    totalStores = PriceConverter.parseInt(json['total_stores']);
    totalOrders = PriceConverter.parseInt(json['total_orders']);
    totalProducts = PriceConverter.parseInt(json['total_products']);
    totalCustomers = PriceConverter.parseInt(json['total_customers']);
    if (json['latest_orders'] != null) {
      latestOrders = <LatestOrders>[];
      json['latest_orders'].forEach((v) {
        latestOrders!.add(LatestOrders.fromJson(v));
      });
    }
    if (json['top_products'] != null) {
      topProducts = <TopProducts>[];
      json['top_products'].forEach((v) {
        topProducts!.add(TopProducts.fromJson(v));
      });
    }
    if (json['top_brands'] != null) {
      topBrands = <TopProducts>[];
      json['top_brands'].forEach((v) {
        topBrands!.add(TopProducts.fromJson(v));
      });
    }
    if (json['top_categories'] != null) {
      topCategories = <TopProducts>[];
      json['top_categories'].forEach((v) {
        topCategories!.add(TopProducts.fromJson(v));
      });
    }
    if (json['top_customers'] != null) {
      topCustomers = <TopCustomers>[];
      json['top_customers'].forEach((v) {
        topCustomers!.add(TopCustomers.fromJson(v));
      });
    }
    totalBrands = PriceConverter.parseInt(json['total_brands']);
    totalCategories = PriceConverter.parseInt(json['total_categories']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_stores'] = totalStores;
    data['total_orders'] = totalOrders;
    data['total_products'] = totalProducts;
    data['total_customers'] = totalCustomers;
    if (latestOrders != null) {
      data['latest_orders'] =
          latestOrders!.map((v) => v.toJson()).toList();
    }
    if (topProducts != null) {
      data['top_products'] = topProducts!.map((v) => v.toJson()).toList();
    }
    if (topBrands != null) {
      data['top_brands'] = topBrands!.map((v) => v.toJson()).toList();
    }
    if (topCategories != null) {
      data['top_categories'] =
          topCategories!.map((v) => v.toJson()).toList();
    }
    if (topCustomers != null) {
      data['top_customers'] =
          topCustomers!.map((v) => v.toJson()).toList();
    }
    data['total_brands'] = totalBrands;
    data['total_categories'] = totalCategories;
    return data;
  }
}

class LatestOrders {
  int? id;
  String? orderNumber;
  double? grandTotal;
  String? orderDate;
  Customer? customer;
  OrderStatus? orderStatus;

  LatestOrders(
      {this.id,
        this.orderNumber,
        this.grandTotal,
        this.orderDate,
        this.customer,
        this.orderStatus});

  LatestOrders.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    orderNumber = json['order_number'];
    grandTotal = PriceConverter.parseAmount(json['grand_total']);
    orderDate = json['order_date'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    orderStatus = json['order_status'] != null
        ? OrderStatus.fromJson(json['order_status'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = orderNumber;
    data['grand_total'] = grandTotal;
    data['order_date'] = orderDate;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (orderStatus != null) {
      data['order_status'] = orderStatus!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;

  Customer({this.id, this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class OrderStatus {
  int? id;
  String? name;

  OrderStatus({this.id, this.name});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class TopProducts {
  int? id;
  String? name;
  String? totalSold;

  TopProducts({this.id, this.name, this.totalSold});

  TopProducts.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    totalSold = json['total_sold'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['total_sold'] = totalSold;
    return data;
  }
}

class TopCustomers {
  int? id;
  String? name;
  String? phone;
  int? totalOrders;
  String? totalSpent;

  TopCustomers(
      {this.id, this.name, this.phone, this.totalOrders, this.totalSpent});

  TopCustomers.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    phone = json['phone'];
    totalOrders = PriceConverter.parseInt(json['total_orders']);
    totalSpent = json['total_spent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['total_orders'] = totalOrders;
    data['total_spent'] = totalSpent;
    return data;
  }
}

class Wallet {
  double? inhouseEarning;
  double? commissionEarned;
  double? deliveryChargeEarned;
  double? totalTax;
  double? pendingAmount;

  Wallet(
      {this.inhouseEarning,
        this.commissionEarned,
        this.deliveryChargeEarned,
        this.totalTax,
        this.pendingAmount});

  Wallet.fromJson(Map<String, dynamic> json) {
    inhouseEarning = PriceConverter.parseAmount(json['inhouse_earning']);
    commissionEarned = PriceConverter.parseAmount(json['commission_earned']);
    deliveryChargeEarned = PriceConverter.parseAmount(json['delivery_charge_earned']);
    totalTax = PriceConverter.parseAmount(json['total_tax']);
    pendingAmount = PriceConverter.parseAmount(json['pending_amount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['inhouse_earning'] = inhouseEarning;
    data['commission_earned'] = commissionEarned;
    data['delivery_charge_earned'] = deliveryChargeEarned;
    data['total_tax'] = totalTax;
    data['pending_amount'] = pendingAmount;
    return data;
  }
}

class OrderStatusCounts {
  int? id;
  String? name;
  int? total;

  OrderStatusCounts({this.id, this.name, this.total});

  OrderStatusCounts.fromJson(Map<String, dynamic> json) {
    id = PriceConverter.parseInt(json['id']);
    name = json['name'];
    total = PriceConverter.parseInt(json['total']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['total'] = total;
    return data;
  }
}

class OrderChart {
  String? label;
  double? total;

  OrderChart({this.label, this.total});

  OrderChart.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    total = PriceConverter.parseAmount(json['total']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['total'] = total;
    return data;
  }
}

class Earnings {
  double? totalSales;
  double? totalPaid;
  double? totalDue;
  double? completedSales;

  Earnings(
      {this.totalSales, this.totalPaid, this.totalDue, this.completedSales});

  Earnings.fromJson(Map<String, dynamic> json) {
    totalSales = PriceConverter.parseAmount(json['total_sales']);
    totalPaid = PriceConverter.parseAmount(json['total_paid']);
    totalDue = PriceConverter.parseAmount(json['total_due']);
    completedSales = PriceConverter.parseAmount(json['completed_sales']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_sales'] = totalSales;
    data['total_paid'] = totalPaid;
    data['total_due'] = totalDue;
    data['completed_sales'] = completedSales;
    return data;
  }
}

class UserOverview {
  int? customers;
  int? vendors;
  int? deliveryMan;

  UserOverview({this.customers, this.vendors, this.deliveryMan});

  UserOverview.fromJson(Map<String, dynamic> json) {
    customers = PriceConverter.parseInt(json['customers']);
    vendors = PriceConverter.parseInt(json['vendors']);
    deliveryMan = PriceConverter.parseInt(json['delivery_man']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customers'] = customers;
    data['vendors'] = vendors;
    data['delivery_man'] = deliveryMan;
    return data;
  }
}

class Filters {
  String? fromDate;
  String? toDate;
  String? period;

  Filters({this.fromDate, this.toDate, this.period});

  Filters.fromJson(Map<String, dynamic> json) {
    fromDate = json['from_date'];
    toDate = json['to_date'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['period'] = period;
    return data;
  }
}

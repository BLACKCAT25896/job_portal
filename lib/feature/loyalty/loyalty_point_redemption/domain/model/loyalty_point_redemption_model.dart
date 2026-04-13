

class LoyaltyPointRedemptionItem {
  String? id;
  String? name;
  String? phone;
  String? companyName;
  String? contactPerson;
  String? alternatePhone;
  String? email;
  String? website;
  String? image;
  String? address;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? taxNumber;
  String? bankName;
  String? bankAccountName;
  String? bankAccountNumber;
  String? ifscCode;
  String? openingBalance;
  String? openingBalanceDate;
  String? due;
  String? balance;
  String? supplyType;
  String? paymentTerms;
  String? creditLimit;
  String? rating;
  String? notes;
  String? contractFile;
  String? tradeLicense;
  String? nidNumber;
  String? status;
  String? createdAt;

  LoyaltyPointRedemptionItem(
      {this.id,
        this.name,
        this.phone,
        this.companyName,
        this.contactPerson,
        this.alternatePhone,
        this.email,
        this.website,
        this.image,
        this.address,
        this.city,
        this.state,
        this.country,
        this.postalCode,
        this.taxNumber,
        this.bankName,
        this.bankAccountName,
        this.bankAccountNumber,
        this.ifscCode,
        this.openingBalance,
        this.openingBalanceDate,
        this.due,
        this.balance,
        this.supplyType,
        this.paymentTerms,
        this.creditLimit,
        this.rating,
        this.notes,
        this.contractFile,
        this.tradeLicense,
        this.nidNumber,
        this.status,
        this.createdAt});

  LoyaltyPointRedemptionItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    phone = json['phone'].toString();
    companyName = json['company_name'];
    contactPerson = json['contact_person'];
    alternatePhone = json['alternate_phone'].toString();
    email = json['email'];
    website = json['website'];
    image = json['image'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postal_code'].toString();
    taxNumber = json['tax_number'].toString();
    bankName = json['bank_name'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'].toString();
    ifscCode = json['ifsc_code'];
    openingBalance = json['opening_balance'].toString();
    openingBalanceDate = json['opening_balance_date'];
    due = json['due'].toString();
    balance = json['balance'].toString();
    supplyType = json['supply_type'].toString();
    paymentTerms = json['payment_terms'];
    creditLimit = json['credit_limit'].toString();
    rating = json['rating'].toString();
    notes = json['notes'];
    contractFile = json['contract_file'];
    tradeLicense = json['trade_license'];
    nidNumber = json['nid_number'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['company_name'] = companyName;
    data['contact_person'] = contactPerson;
    data['alternate_phone'] = alternatePhone;
    data['email'] = email;
    data['website'] = website;
    data['image'] = image;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['tax_number'] = taxNumber;
    data['bank_name'] = bankName;
    data['bank_account_name'] = bankAccountName;
    data['bank_account_number'] = bankAccountNumber;
    data['ifsc_code'] = ifscCode;
    data['opening_balance'] = openingBalance;
    data['opening_balance_date'] = openingBalanceDate;
    data['due'] = due;
    data['balance'] = balance;
    data['supply_type'] = supplyType;
    data['payment_terms'] = paymentTerms;
    data['credit_limit'] = creditLimit;
    data['rating'] = rating;
    data['notes'] = notes;
    data['contract_file'] = contractFile;
    data['trade_license'] = tradeLicense;
    data['nid_number'] = nidNumber;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}


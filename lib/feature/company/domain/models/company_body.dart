class CompanyBody {
  String? name;
  String? slug;
  String? ceo;
  int? industryId;
  int? ownerShipTypeId;
  int? companySizeId;
  int? establishedIn;
  String? details;
  String? website;
  String? location;
  int? isFeatured;
  String? uniqueId;
  int? status;
  String? sMethod;

  CompanyBody(
      {this.name,
        this.slug,
        this.ceo,
        this.industryId,
        this.ownerShipTypeId,
        this.companySizeId,
        this.establishedIn,
        this.details,
        this.website,
        this.location,
        this.isFeatured,
        this.uniqueId,
        this.status,
        this.sMethod});

  CompanyBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    ceo = json['ceo'];
    industryId = json['industry_id'];
    ownerShipTypeId = json['owner_ship_type_id'];
    companySizeId = json['company_size_id'];
    establishedIn = json['established_in'];
    details = json['details'];
    website = json['website'];
    location = json['location'];
    isFeatured = json['is_featured'];
    uniqueId = json['unique_id'];
    status = json['status'];
    sMethod = json['_method'];
  }

  void addIfNotNull(Map<String, dynamic> map, String key, dynamic value) {
    if (value != null) {
      map[key] = value.toString();
    }
  }

  Map<String, String> toJson() {
    final Map<String, String> data = {};
    addIfNotNull(data, 'name', name);
    addIfNotNull(data, 'slug', slug);
    addIfNotNull(data, 'ceo', ceo);
    addIfNotNull(data, 'industry_id', industryId);
    addIfNotNull(data, 'owner_ship_type_id', ownerShipTypeId);
    addIfNotNull(data, 'company_size_id', companySizeId);
    addIfNotNull(data, 'established_in', establishedIn);
    addIfNotNull(data, 'details', details);
    addIfNotNull(data, 'website', website);
    addIfNotNull(data, 'location', location);
    addIfNotNull(data, 'is_featured', isFeatured);
    addIfNotNull(data, 'unique_id', uniqueId);
    addIfNotNull(data, 'status', status);
    addIfNotNull(data, '_method', sMethod);
    return data;
  }
}

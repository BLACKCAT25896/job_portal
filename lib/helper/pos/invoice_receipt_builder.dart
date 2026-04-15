// import 'package:ecommerce/helper/pos/esc_pos_builder.dart';
//
// class InvoiceReceiptBuilder {
//   /// Builds a receipt with restaurant info, items, addons, and totals
//   static EscPosBuilder build(Invoice invoice, {String? name, String? address, String? domain}) {
//     final b = EscPosBuilder();
//     b.init();
//
//     // --- HEADER ---
//     b.alignCenter();
//     b.bold(true);
//     b.text(name ?? "RESTAURANT");
//     b.bold(false);
//
//     if (domain != null && domain.isNotEmpty) b.text(domain);
//     if (address != null && address.isNotEmpty) b.text(address);
//
//     b.text("------------------------");
//
//     // --- ITEMS & ADDONS ---
//     b.alignLeft();
//     for (final i in invoice.items ?? []) {
//       final itemName = i.food?.name ?? '';
//       final variantName = i.variant?.name ?? '';
//       b.text("$itemName${variantName.isNotEmpty ? ' - $variantName' : ''}");
//       b.text(" ${i.quantity} x ${i.price}");
//
//       for (final ad in i.addons ?? []) {
//         final addonPrice = ad.price != null ? " +${ad.price}" : "";
//         b.text("  + ${ad.name}$addonPrice");
//       }
//
//       b.text("");
//     }
//
//     b.text("------------------------");
//
//     // --- DISCOUNT & TAX ---
//     b.text("Discount: ${invoice.discount ?? 0}");
//     b.text("Tax: ${invoice.tax ?? 0}");
//
//     // --- TOTAL ---
//     b.bold(true);
//     b.text("Total: ${invoice.subtotal ?? 0}");
//     b.bold(false);
//
//     // --- FOOTER ---
//     b.text("");
//     b.text("Thank you!");
//     b.text("");
//     b.cut();
//
//     return b;
//   }
// }

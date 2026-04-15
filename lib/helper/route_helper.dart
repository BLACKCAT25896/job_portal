

import 'package:ecommerce/feature/human_resource/salary_generate/presentation/screens/create_new_salary_generate_screen.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/screens/brand_screen.dart';
import 'package:ecommerce/feature/inventory/brand/presentation/screens/create_new_brand_screen.dart';
import 'package:ecommerce/feature/inventory/category/presentation/screens/category_screen.dart';
import 'package:ecommerce/feature/inventory/category/presentation/screens/create_new_category_screen.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/presentation/screens/create_new_unit_screen.dart';
import 'package:ecommerce/feature/inventory/unit_measurement/presentation/screens/unit_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce/feature/account_management/accounting/presentation/screen/account_screen.dart';
import 'package:ecommerce/feature/account_management/deposit/presentation/screen/deposit_screen.dart';
import 'package:ecommerce/feature/account_management/deposit_category/presentation/screen/deposit_category_screen.dart';
import 'package:ecommerce/feature/account_management/expense/presentation/screen/expense_screen.dart';
import 'package:ecommerce/feature/account_management/expense_category/presentation/screen/expense_category_screen.dart';
import 'package:ecommerce/feature/account_management/fund/presentation/screens/fund_screen.dart';
import 'package:ecommerce/feature/cms_management/about_us/presentation/screens/about_us_screen.dart';
import 'package:ecommerce/feature/cms_management/cms_settings/presentation/screens/system_setting_screen.dart';
import 'package:ecommerce/feature/cms_management/policy_pages/presentation/screens/policy_pages_screen.dart';
import 'package:ecommerce/feature/authentication/presentation/screen/delete_account_screen.dart';
import 'package:ecommerce/feature/authentication/presentation/screen/login_screen.dart';
import 'package:ecommerce/feature/cms_management/banner/presentation/screens/banner_screen.dart';
import 'package:ecommerce/feature/cms_management/explore/presentation/screens/explore_screen.dart';
import 'package:ecommerce/feature/cms_management/faq/presentation/screens/faq_screen.dart';
import 'package:ecommerce/feature/cms_management/feedback/presentation/screens/feedback_screen.dart';
import 'package:ecommerce/feature/cms_management/why_choose/presentation/screens/why_choose_us_screen.dart';
import 'package:ecommerce/feature/dashboard/views/dashboard_screen.dart';
import 'package:ecommerce/feature/human_resource/attendance/presentation/screens/attendance_screen.dart';
import 'package:ecommerce/feature/human_resource/award/presentation/screens/award_screen.dart';
import 'package:ecommerce/feature/human_resource/candidate/presentation/screens/candidate_screen.dart';
import 'package:ecommerce/feature/human_resource/department/presentation/screens/department_screen.dart';
import 'package:ecommerce/feature/human_resource/designation/presentation/screens/designation_screen.dart';
import 'package:ecommerce/feature/human_resource/interview/presentation/screens/interview_screen.dart';
import 'package:ecommerce/feature/human_resource/leave_application/presentation/screens/leave_application_screen.dart';
import 'package:ecommerce/feature/human_resource/leave_type/presentation/screens/leave_type_screen.dart';
import 'package:ecommerce/feature/human_resource/loan/presentation/screens/loan_screen.dart';
import 'package:ecommerce/feature/human_resource/loan_installment/presentation/screens/loan_installment_screen.dart';
import 'package:ecommerce/feature/human_resource/recruitment/presentation/screens/recruitment_screen.dart';
import 'package:ecommerce/feature/human_resource/salary_generate/presentation/screens/salary_generate_screen.dart';
import 'package:ecommerce/feature/human_resource/salary_setup/presentation/screens/salary_setup_screen.dart';
import 'package:ecommerce/feature/human_resource/salary_type/presentation/screens/salary_type_screen.dart';
import 'package:ecommerce/feature/human_resource/weekly_holiday/presentation/screens/weekly_holiday_screen.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point/presentation/screens/loyalty_point_screen.dart';
import 'package:ecommerce/feature/loyalty/loyalty_point_redemption/presentation/screens/loyalty_point_redemption_screen.dart';
import 'package:ecommerce/feature/notification/presentation/screens/notification_screen.dart';
import 'package:ecommerce/feature/payment_method/presentation/screens/payment_method_screen.dart';
import 'package:ecommerce/feature/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce/feature/report_management/presentation/opening_stock_report/opening_stock_report_screen.dart';
import 'package:ecommerce/feature/report_management/presentation/stock_report/stock_report_screen.dart';
import 'package:ecommerce/feature/role_and_permission/role/presentation/screens/role_screen.dart';
import 'package:ecommerce/feature/role_and_permission/user/presentation/screens/user_screen.dart';
import 'package:ecommerce/feature/setting/presentation/widgets/facebook_setting.dart';
import 'package:ecommerce/feature/setting/presentation/widgets/language_setting.dart';
import 'package:ecommerce/feature/setting/presentation/widgets/system_setting.dart';
import 'package:ecommerce/feature/setting/presentation/widgets/whatsapp_setting.dart';
import 'package:ecommerce/feature/support_ticket/screens/add_ticket_screen.dart';
import 'package:ecommerce/feature/support_ticket/screens/support_conversation_screen.dart';
import 'package:ecommerce/feature/support_ticket/screens/support_ticket_screen.dart';
import 'package:ecommerce/feature/support_ticket/screens/ticket_category_screen.dart';
import 'package:ecommerce/feature/tax_management/tax/presentation/screens/tax_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String home = '/home';
  static const String signIn = '/admin/login';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerify = '/otp-verify';
  static const String resetPassword = '/reset-password';
  static const String dashboard = '/dashboard';
  static const String notification = '/notification';
  static const String profile = '/profile';



  static const String aboutUs = '/about-us';
  static const String banner = '/banner';
  static const String explore = '/explore';
  static const String whyChooseUs = '/conceptual-video';
  static const String faq = '/faq';
  static const String feedback = '/feedback';
  static const String academicImage = '/academic-image';
  static const String policyPages = '/policy-pages';
  static const String websiteSetting = '/website-setting';


  static const String deleteAccount = '/delete-account';
  static const String paymentMethod = '/payment-method';
  static String getPaymentMethodRoute() => paymentMethod;




  //HRM
  static const String department = '/department';
  static String getDepartmentRoute() => department;
  static const String designation = '/designation';
  static String getDesignationRoute() => designation;
  static const String attendance = '/attendance';
  static String getAttendanceRoute() => attendance;
  static const String award = '/award';
  static String getAwardRoute() => award;
  static const String candidate = '/candidate';
  static String getCandidateRoute() => candidate;
  static const String employee = '/employee';
  static String getEmployeeRoute() => employee;
  static const String interview = '/interview';
  static String getInterviewRoute() => interview;
  static const String leaveApplication = '/leave-application';
  static String getLeaveApplicationRoute() => leaveApplication;
  static const String leaveType = '/leave-type';
  static String getLeaveTypeRoute() => leaveType;
  static const String loan = '/loan';
  static String getLoanRoute() => loan;
  static const String loanInstallment = '/loan-installment';
  static String getLoanInstallmentRoute() => loanInstallment;
  static const String recruitment = '/recruitment';
  static String getRecruitmentRoute() => recruitment;
  static const String salaryGenerate = '/salary-generate';
  static String getSalaryGenerateRoute() => salaryGenerate;

  static const String generateNewSalary = '/generate-new-salary';
  static String getGenerateNewSalaryRoute() => generateNewSalary;


  static const String salarySetup = '/salary-setup';
  static String getSalarySetupRoute() => salarySetup;
  static const String salaryType = '/salary-type';
  static String getSalaryTypeRoute() => salaryType;
  static const String weeklyHoliday = '/weekly-holiday';
  static String getWeeklyHolidayRoute() => weeklyHoliday;

  static const String roles = '/roles';
  static String getRolesRoute() => roles;
  static const String users = '/users';
  static String getUsersRoute() => users;

  static const String customer = '/customer';
  static String getCustomerRoute() => customer;

  //setting
  static const String whatsappSetting = '/whatsapp-setting';
  static String getWhatsappSettingRoute() => whatsappSetting;
  static const String facebookSetting = '/facebook-setting';
  static String getFacebookSettingRoute() => facebookSetting;
  static const String taxSetting = '/tax-setting';
  static String getTaxSettingRoute() => taxSetting;



  //Reports
  static const String purchaseReport = '/purchase-report';
  static String getPurchaseReportRoute() => purchaseReport;

  static const String stockReport = '/stock-report';
  static String getStockReportRoute() => stockReport;
  static const String openingStockReport = '/opening-stock-report';
  static String getOpeningStockReportRoute() => openingStockReport;



//Accounting
  static const String accounting = '/accounting';
  static String getAccountingRoute() => accounting;
  static const String deposit = '/deposit';
  static String getDepositRoute() => deposit;
  static const String depositCategory = '/deposit-category';
  static String getDepositCategoryRoute() => depositCategory;

  static const String expense = '/expense';
  static String getExpenseRoute() => expense;
  static const String expenseCategory = '/expense-category';
  static String getExpenseCategoryRoute() => expenseCategory;

  static const String fund = '/fund';
  static String getFundRoute() => fund;


  static const String loyaltyPoint = '/loyalty-point';
  static String getLoyaltyPointRoute() => loyaltyPoint;

  static const String loyaltyPointRedemption = '/loyalty-point-redemption';
  static String getLoyaltyPointRedemptionRoute() => loyaltyPointRedemption;

  static const String pages = '/pages';
  static String getPagesRoute() => pages;

  //General Setting
  static const String systemSetting = '/system-setting';
  static String getSystemSettingRoute() => systemSetting;
  static const String paymentMethodSetting = '/payment-method-setting';
  static String getPaymentMethodSettingRoute() => paymentMethodSetting;
  static const String customerTypeSetting = '/customer-type-setting';
  static String getCustomerTypeSettingRoute() => customerTypeSetting;

  static const String unitMeasurementSetting = '/unit-measurement-setting';
  static String getUnitMeasurementSettingRoute() => unitMeasurementSetting;

  static const String smsSetting = '/sms-setting';
  static String getSmsSettingRoute() => smsSetting;
  static const String bankSetting = '/bank-setting';
  static String getBankSettingRoute() => bankSetting;
  static const String languageSetting = '/language-setting';
  static String getLanguageSettingRoute() => languageSetting;



  static const String supportTicketCategory = '/support-ticket-category';
  static String getSupportTicketCategoryRoute() => supportTicketCategory;

  static const String supportTicket = '/support-ticket';
  static String getSupportTicketRoute() => supportTicket;

  static const String newTicket = '/new-ticket';
  static String getNewTicketRoute() => newTicket;

  static const String ticketDetail = '/ticket-detail';
  static String getTicketDetailRoute(String id) => "$ticketDetail?id=$id";


  static const String addNewUnit = '/add-new-unit';
  static String getAddNewUnitRoute () => addNewUnit;

  static const String brand = '/brand';
  static String getBrandRoute () => brand;

  static const String addNewBrand = '/add-new-brand';
  static String getAddNewBrandRoute () => addNewBrand;

  static const String category = '/category';
  static String getCategoryRoute () => category;

  static const String addNewCategory = '/add-new-category';
  static String getAddNewCategoryRoute () => addNewCategory;

  static const String subCategory = '/sub-category';
  static String getSubCategoryRoute () => subCategory;

  static const String addNewSubCategory = '/add-new-sub-category';
  static String getAddNewSubCategoryRoute () => addNewSubCategory;



  static String getInitialRoute() => initial;
  static String getSignInRoute() => signIn;
  static String getLoginRoute() => login;
  static String getDashboardRoute() => dashboard;
  static String getProfileRoute() => profile;

  //cms control
  static String getAboutUsRoute() => aboutUs;
  static String getBannerRoute() => banner;
  static String getExploreRoute() => explore;
  static String getWhyChooseUsRoute() => whyChooseUs;
  static String getFaqRoute() => faq;
  static String getFeedbackRoute() => feedback;
  static String getAcademicImageRoute() => academicImage;
  static String getPolicyPagesRoute() => policyPages;
  static String getWebsiteSettingRoute() => websiteSetting;


  static String getDeleteAccountRoute() => deleteAccount;
  static String getNotificationRoute() => notification;



  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const LoginScreen()),
    GetPage(name: signIn, page: () => const LoginScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: deleteAccount, page: () => const DeleteAccountScreen()),
    GetPage(name: notification, page: () => const NotificationScreen()),



    //cms
    GetPage(name: whyChooseUs, page: () => const WhyChooseUsScreen()),
    GetPage(name: banner, page: () => const BannerScreen()),
    GetPage(name: aboutUs, page: () => const AboutUsScreen()),
    GetPage(name: explore, page: () => const ExploreScreen()),
    GetPage(name: faq, page: () => const FaqScreen()),
    GetPage(name: feedback, page: () => const FeedbackScreen()),
    GetPage(name: websiteSetting, page: () => const SystemSettingScreen()),


    GetPage(name: paymentMethod, page: () => const PaymentMethodScreen()),
    GetPage(name: roles, page: () => const RoleManagementScreen()),
    GetPage(name: users, page: () => const UserScreen()),



    //HRM
    GetPage(name: department, page: () => const DepartmentScreen()),
    GetPage(name: designation, page: () => const DesignationScreen()),
    GetPage(name: attendance, page: () => const AttendanceScreen()),
    GetPage(name: award, page: () => const AwardScreen()),
    GetPage(name: candidate, page: () => const CandidateScreen()),
    GetPage(name: interview, page: () => const InterviewScreen()),
    GetPage(name: leaveApplication, page: () => const LeaveApplicationScreen()),
    GetPage(name: leaveType, page: () => const LeaveTypeScreen()),
    GetPage(name: loan, page: () => const LoanScreen()),
    GetPage(name: loanInstallment, page: () => const LoanInstallmentScreen()),
    GetPage(name: recruitment, page: () => const RecruitmentScreen()),
    GetPage(name: salaryGenerate, page: () => const SalaryGenerateScreen()),
    GetPage(name: generateNewSalary, page: () => const CreateNewSalaryGenerateScreen()),
    GetPage(name: salarySetup, page: () => const SalarySetupScreen()),
    GetPage(name: salaryType, page: () => const SalaryTypeScreen()),
    GetPage(name: weeklyHoliday, page: () => const WeeklyHolidayScreen()),


    //setting
    GetPage(name: whatsappSetting, page: () => const WhatsappSetting()),
    GetPage(name: facebookSetting, page: () => const FacebookSetting()),
    GetPage(name: taxSetting, page: () => const TaxScreen()),


    //Reports
    GetPage(name: stockReport, page: () => const StockReportScreen()),
    GetPage(name: openingStockReport, page: () => const OpeningStockReportScreen()),

    //Accounting
    GetPage(name: accounting, page: () => const AccountScreen()),
    GetPage(name: deposit, page: () => const DepositScreen()),
    GetPage(name: depositCategory, page: () => const DepositCategoryScreen()),
    GetPage(name: expense, page: () => const ExpenseScreen()),
    GetPage(name: expenseCategory, page: ()=> ExpenseCategoryScreen()),
    GetPage(name: fund, page: ()=> FundScreen()),

    //Loyalty

    GetPage(name: loyaltyPoint, page: ()=> LoyaltyPointScreen()),
    GetPage(name: loyaltyPointRedemption, page: ()=> LoyaltyPointRedemptionScreen()),

    //waste Tracking
    GetPage(name: pages, page: ()=> PolicyPagesScreen()),

    //General Setting
    GetPage(name: systemSetting, page: ()=> SystemSetting()),
    GetPage(name: paymentMethodSetting, page: ()=> SystemSetting()),
    GetPage(name: customerTypeSetting, page: ()=> SystemSetting()),
    GetPage(name: unitMeasurementSetting, page: ()=> UnitScreen()),
    GetPage(name: addNewUnit, page: ()=> CreateNewUnitScreen()),
    GetPage(name: smsSetting, page: ()=> SystemSetting()),
    GetPage(name: bankSetting, page: ()=> SystemSetting()),
    GetPage(name: languageSetting, page: ()=> LanguageSetting()),


    GetPage(name: supportTicketCategory, page: ()=> SupportTicketCategoryScreen()),
    GetPage(name: supportTicket, page: ()=> SupportTicketScreen()),
    GetPage(name: newTicket, page: ()=> AddTicketScreen()),
    GetPage(name: ticketDetail, page: ()=> SupportConversationScreen(ticketId: Get.parameters['id']??"0")),


    GetPage(name: brand, page: ()=> BrandScreen()),
    GetPage(name: addNewBrand, page: ()=> CreateNewBrandScreen()),
    GetPage(name: category, page: ()=> CategoryScreen()),
    GetPage(name: addNewCategory, page: ()=> CreateNewCategoryScreen()),


  ];
}

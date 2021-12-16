import 'package:flutter/material.dart';
import 'package:yollet/UI/AccountInfoPage.dart';
import 'package:yollet/UI/AccountTransferCompletePage.dart';
import 'package:yollet/UI/AccountTransferDetailPage.dart';
import 'package:yollet/UI/AccountTransferInputBalancePage.dart';
import 'package:yollet/UI/AccountTransferPage.dart';
import 'package:yollet/UI/AccountTransferPasscodePage.dart';
import 'package:yollet/UI/AssignTokenCompletePage.dart';
import 'package:yollet/UI/AssignTokenConfirmPage.dart';
import 'package:yollet/UI/AssignTokenPage.dart';
import 'package:yollet/UI/CreateAccountCompletePage.dart';
import 'package:yollet/UI/CreateAccountConfirmMnemonicPage.dart';
import 'package:yollet/UI/CreateAccountConfirmPage.dart';
import 'package:yollet/UI/CreateAccountEthMnemonicQuizConfirmPage.dart';
import 'package:yollet/UI/CreateAccountEthMnemonicQuizPage.dart';
import 'package:yollet/UI/CreateAccountNamePage.dart';
import 'package:yollet/UI/CreateAccountPage.dart';
import 'package:yollet/UI/CreateEthAccountCompletePage.dart';
import 'package:yollet/UI/CreatePassCodePage.dart';
import 'package:yollet/UI/CreateVixcoAddressPassCodePage.dart';
import 'package:yollet/UI/CreateWalletCompletePage.dart';
import 'package:yollet/UI/CreateWalletNamePage.dart';
import 'package:yollet/UI/CreateWalletPage.dart';
import 'package:yollet/UI/EnterPassCodePage.dart';
import 'package:yollet/UI/ExchangeRatePage.dart';
import 'package:yollet/UI/ExportCautionPage.dart';
import 'package:yollet/UI/ExportPassCodePage.dart';
import 'package:yollet/UI/ExportPhoneNumPage.dart';
import 'package:yollet/UI/FindPasswordComplete.dart';
import 'package:yollet/UI/FindPasswordCautionPage.dart';
import 'package:yollet/UI/FindPasswordPhoneNumberPage.dart';
import 'package:yollet/UI/FindPasswordVerifyPage.dart';
import 'package:yollet/UI/ImportCautionPage.dart';
import 'package:yollet/UI/ImportEthAccountCompletePage.dart';
import 'package:yollet/UI/ImportMnemonicPhasePage.dart';
import 'package:yollet/UI/ImportPassCodePage.dart';
import 'package:yollet/UI/ImportVerifyPage.dart';
import 'package:yollet/UI/IntroPage.dart';
import 'package:yollet/UI/LoginPage.dart';
import 'package:yollet/UI/MainPage.dart';
import 'package:yollet/UI/MainView.dart';
import 'package:yollet/UI/MemberRegistrationPage.dart';
import 'package:yollet/UI/MerchantRegistrationCompletePage.dart';
import 'package:yollet/UI/MerchantRegistrationPage.dart';
import 'package:yollet/UI/MerchantRegistrationVerifyPage.dart';
import 'package:yollet/UI/NotificationPage.dart';
import 'package:yollet/UI/PayTransferCompletePage.dart';
import 'package:yollet/UI/PayTransferPasscodePage.dart';
import 'package:yollet/UI/SampleWidget.dart';
import 'package:yollet/UI/SampleWidget2.dart';
import 'package:yollet/UI/SampleWidget3.dart';
import 'package:yollet/UI/SampleWidget4.dart';
import 'package:yollet/UI/SampleWidget5.dart';
import 'package:yollet/UI/SampleWidget6.dart';
import 'package:yollet/UI/SettingAccountPage.dart';
import 'package:yollet/UI/SettingCheckChangeAccountPage.dart';
import 'package:yollet/UI/SettingCheckDeleteAccountPage.dart';
import 'package:yollet/UI/SettingLanguagePage.dart';
import 'package:yollet/UI/SettingNotificationPage.dart';
import 'package:yollet/UI/SettingPage.dart';
import 'package:yollet/UI/SettingPaymentMethodPage.dart';
import 'package:yollet/UI/SettingPassCodePage.dart';
import 'package:yollet/UI/SettingTermsOfServicePage.dart';
import 'package:yollet/UI/SettingVersion.dart';
import 'package:yollet/UI/SignUpCompletePage.dart';
import 'package:yollet/UI/SignUpPage.dart';
import 'package:yollet/UI/SignUpPhoneNumberPage.dart';
import 'package:yollet/UI/SignUpTermsOfServicePage.dart';
import 'package:yollet/UI/SplashScreen.dart';
import 'package:yollet/UI/WalletPage.dart';

class AppRoutes {
  static const home = "/";
  static const splash = "/splash";
  static const setting = "/setting";
  static const settingProfile = "/settingProfile";
  static const settingCheckChangeAccount = "/settingCheckChangeAccount";
  static const settingCheckDeleteAccount = "/settingCheckDeleteAccount";
  static const settingChangePassword = "/settingChangePassword";
  static const settingChangePhoneNumber = "/settingChangePhoneNumber";
  static const settingNotification = "/settingNotification";
  static const settingLanguage = "/settingLanguage";
  static const settingPaymentMethod = "/settingPaymentMethod";
  static const settingPasscode = "/settingPasscode";
  static const settingTerms = "/settingTerms";
  static const settingVersion = "/settingVersion";
  static const notification = "/notification";
  static const notificationDetail = "/notificationDetail";
  static const intro = "/intro";
  static const bigPayPage = "/bigPayPage";
  // static const introCheck = "/introCheck";
  static const login = "/login";
  static const signUp = "/signUp";
  static const signUpTerms = "/signUpTerms";
  static const signUpVerifyPhoneNumber = "/signUpVerifyPhoneNumber";
  static const createPassCode = "/createPassCode";
  static const enterPassCode = "/enterPassCode";
  static const signUpComplete = "/signUpComplete";
  // static const home = "/main";
  static const createAccount = "/createAccount";
  static const createAccountName = "/createAccountName";
  static const createAccountConfirm = "/createAccountConfirm";
  static const createAccountComplete = "/createAccountComplete";
  static const assignToken = "/assignToken";
  static const assignTokenConfirm = "/assignTokenConfirm";
  static const assignTokenComplete = "/assignTokenComplete";
  static const exchangeRatePage = "/exchangeRatePage";

  static const createWallet = "/createWallet";
  static const createWalletName = "/createWalletName";
  static const createWalletComplete = "/createWalletComplete";
  static const transfer = "/transfer";
  static const wallet = "/wallet";
  static const sample1 = "/sample1";
  static const sample2 = "/sample2";
  static const sample3 = "/sample3";
  static const sample4 = "/sample4";
  static const sample5 = "/sample5";
  static const sample6 = "/sample6";

  static const accountInfo = "/accountInfo";
  static const accountTransferDetail = "/accountTransferDetail";
  static const accountTransfer = "/accountTransfer";
  static const accountTransferInputBalance = "/accountTransferInputBalance";
  static const accountTransferPasscode = "/accountTransferPasscode";
  static const accountTransferComplete = "/accountTransferComplete";

  static const payTransferPasscode = "/payTransferPasscode";
  static const payTransferComplete = "/payTransferComplete";
  // static const transfer = "/transfer";
  // static const transfer = "/transfer";
  // static const transfer = "/transfer";

  static const merchantRegistration = "/merchantRegistration";
  static const merchantRegistrationVerify = "/merchantRegistrationVerify";
  static const merchantRegistrationComplete = "/merchantRegistrationComplete";

  static const memberRegistrationPage = "/memberRegistrationPage";
  // static const mnemonicPhrasePage = "/mnemonicPhrasePage";
  static const createVixcoAddressPassCodePage = "/createVixcoAddressPassCodePage";
  static const exportVixcoAddressPassCodePage = "/exportVixcoAddressPassCodePage";
  static const importVixcoAddressPassCodePage = "/importVixcoAddressPassCodePage";
  static const createAccountConfirmMnemonic = "/createAccountConfirmMnemonic";
  static const createAccountEthMnemonicQuizPage =
      "/createAccountEthMnemonicQuizConfirmPage";
  static const createAccountEthMnemonicQuizConfirmPage =
      "/createAccountEthMnemonicQuizPage";
  static const createEthAccountCompletePage = "/createEthAccountCompletePage";
  static const exportPhoneNumPage = "/exportPhoneNumPage";
  static const importVerifyPage = "/importVerifyPage";
  static const exportVerifyPage = "/exportVerifyPage";
  static const importMnemonicPhasePage = "/importMnemonicPhasePage";
  static const importEthAccountCompletePage = "/importEthAccountCompletePage";
  static const importCautionPage = "/importCautionPage";
  static const exportCautionPage = "/exportCautionPage";

  static const findPasswordPhoneNumberPage = "/findPasswordPhoneNumberPage";
  static const findPasswordCautionPage = "/findPasswordCautionPage";
  static const findPasswordVerifyPage = "/findPasswordVerifyPage";
  static const findPasswordComplete = "/findPasswordComplete";

  static Map<String, WidgetBuilder> getRoutes() {
    Map<String, WidgetBuilder> base = {
      // AppRoutes.home: (BuildContext context) => MainView(),
      AppRoutes.home: (BuildContext context) => MainPage(),
      AppRoutes.wallet: (BuildContext context) => WalletPage(),
      AppRoutes.splash: (BuildContext context) => SplashScreen(),
      // AppRoutes.setting: (BuildContext context) => SplashScreen(),
      AppRoutes.intro: (BuildContext context) => IntroPage(),
      // AppRoutes.introCheck: (BuildContext context) => IntroCheckPage(),
      AppRoutes.login: (BuildContext context) => LoginPage(),
      AppRoutes.signUp: (BuildContext context) => SignUpPage(),
      AppRoutes.signUpTerms: (BuildContext context) =>
          SignUpTermsOfServicePage(),
      AppRoutes.signUpVerifyPhoneNumber: (BuildContext context) =>
          SignUpPhoneNumberPage(),
      AppRoutes.createPassCode: (BuildContext context) => CreatePassCodePage(),
      AppRoutes.enterPassCode: (BuildContext context) => EnterPassCodePage(),
      AppRoutes.signUpComplete: (BuildContext context) => SignUpCompletePage(),
      // AppRoutes.home: (BuildContext context) => MainPage(),
      AppRoutes.createAccount: (BuildContext context) => CreateAccountPage(),
      AppRoutes.createAccountName: (BuildContext context) =>
          CreateAccountNamePage(),
      AppRoutes.createAccountConfirmMnemonic: (BuildContext context) =>
          CreateAccountConfirmMnemonicPage(),
      AppRoutes.createAccountEthMnemonicQuizPage: (BuildContext context) =>
          CreateAccountEthMnemonicQuizPage(context: context),
      AppRoutes.createAccountEthMnemonicQuizConfirmPage:
          (BuildContext context) => CreateAccountEthMnemonicQuizConfirmPage(),
      AppRoutes.createEthAccountCompletePage: (BuildContext context) =>
          CreateEthAccountCompletePage(),
      AppRoutes.createAccountConfirm: (BuildContext context) =>
          CreateAccountConfirmPage(),
      AppRoutes.createAccountComplete: (BuildContext context) =>
          CreateAccountCompletePage(),
      AppRoutes.assignToken: (BuildContext context) => AssignTokenPage(),
      AppRoutes.assignTokenConfirm: (BuildContext context) =>
          AssignTokenConfirmPage(),
      AppRoutes.assignTokenComplete: (BuildContext context) =>
          AssignTokenCompletePage(),
      AppRoutes.exchangeRatePage: (BuildContext context) => ExchangeRatePage(),

      AppRoutes.createWallet: (BuildContext context) => CreateWalletPage(),
      AppRoutes.createWalletName: (BuildContext context) =>
          CreateWalletNamePage(),
      AppRoutes.createWalletComplete: (BuildContext context) =>
          CreateWalletCompletePage(),
      AppRoutes.sample1: (BuildContext context) => SampleWidget(),
      AppRoutes.sample2: (BuildContext context) => SampleWidget2(),
      AppRoutes.sample3: (BuildContext context) => SampleWidget3(),
      AppRoutes.sample4: (BuildContext context) => SampleWidget4(),
      AppRoutes.sample5: (BuildContext context) => SampleWidget5(),
      AppRoutes.sample6: (BuildContext context) => SampleWidget6(),
      AppRoutes.setting: (BuildContext context) => SettingPage(),
      AppRoutes.settingProfile: (BuildContext context) => SettingAccountPage(),
      AppRoutes.settingCheckChangeAccount: (BuildContext context) =>
          SettingCheckChangeAccountPage(),
      AppRoutes.settingCheckDeleteAccount: (BuildContext context) =>
          SettingCheckDeleteAccountPage(),
      AppRoutes.settingChangePassword: (BuildContext context) =>
          SettingAccountPage(),
      AppRoutes.settingChangePhoneNumber: (BuildContext context) =>
          SettingAccountPage(),

      AppRoutes.transfer: (BuildContext context) => MainView(),

      AppRoutes.accountInfo: (BuildContext context) => AccountInfoPage(),
      AppRoutes.accountTransferDetail: (BuildContext context) =>
          AccountTransferDetailPage(),
      AppRoutes.accountTransfer: (BuildContext context) =>
          AccountTransferPage(),
      AppRoutes.accountTransferInputBalance: (BuildContext context) =>
          AccountTransferInputBalancePage(),
      AppRoutes.accountTransferPasscode: (BuildContext context) =>
          AccountTransferPasscodePage(),
      AppRoutes.accountTransferComplete: (BuildContext context) =>
          AccountTransferCompletePage(),

      AppRoutes.payTransferPasscode: (BuildContext context) =>
          PayTransferPasscodePage(),
      AppRoutes.payTransferComplete: (BuildContext context) =>
          PayTransferCompletePage(),

      AppRoutes.settingNotification: (BuildContext context) =>
          SettingNotificationPage(),
      AppRoutes.settingPaymentMethod: (BuildContext context) =>
          SettingPaymentMethodPage(),
      AppRoutes.settingPasscode: (BuildContext context) =>
          SettingPassCodePage(),
      AppRoutes.notification: (BuildContext context) => NotificationPage(),
      AppRoutes.settingLanguage: (BuildContext context) =>
          SettingLanguagePage(),
      AppRoutes.settingTerms: (BuildContext context) =>
          SettingTermsOfServicePage(),
      AppRoutes.settingVersion: (BuildContext context) => SettingVersionPage(),

      // AppRoutes.notificationDetail: (BuildContext context) => NotificationDetailPage(),

      AppRoutes.merchantRegistration: (BuildContext context) =>
          MerchantRegistrationPage(),
      AppRoutes.merchantRegistrationVerify: (BuildContext context) =>
          MerchantRegistrationVerifyPage(),
      AppRoutes.merchantRegistrationComplete: (BuildContext context) =>
          MerchantRegistrationCompletePage(),

      AppRoutes.memberRegistrationPage: (BuildContext context) =>
          MemberRegistrationPage(),

      AppRoutes.exportVixcoAddressPassCodePage: (BuildContext context) =>
          ExportPassCodePage(),
      AppRoutes.exportPhoneNumPage: (BuildContext context) =>
          ExportPhoneNumPage(),
      AppRoutes.importVixcoAddressPassCodePage: (BuildContext context) =>
          ImportPassCodePage(),
      AppRoutes.createVixcoAddressPassCodePage: (BuildContext context) =>
          CreateVixcoAddressPassCodePage(),

      AppRoutes.importVerifyPage: (BuildContext context) =>
          ImportVerifyPage(),
      AppRoutes.importMnemonicPhasePage: (BuildContext context) =>
          ImportMnemonicPhasePage(),
      AppRoutes.importEthAccountCompletePage: (BuildContext context) =>
          ImportEthAccountCompletePage(),
      AppRoutes.importCautionPage: (BuildContext context) =>
          ImportCautionPage(),
    AppRoutes.exportCautionPage: (BuildContext context) =>
          ExportCautionPage(),

    AppRoutes.findPasswordPhoneNumberPage: (BuildContext context) =>
        FindPasswordPhoneNumberPage(),
    AppRoutes.findPasswordCautionPage: (BuildContext context) =>
        FindPasswordCautionPage(),
    AppRoutes.findPasswordVerifyPage: (BuildContext context) =>
        FindPasswordVerifyPage(),
    AppRoutes.findPasswordComplete: (BuildContext context) =>
        FindPasswordComplete(),
    };

    return base;
  }
}

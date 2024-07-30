import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayIntegration {
  // Instance of razor pay
  final Razorpay _razorpay = Razorpay();

  initiateRazorPay() {
// To handle different event with previous functions
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
// Do something when payment succeeds
    print("Payment Successfull");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
// Do something when payment fails
    print("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
// Do something when an external wallet is selected
    print("External Wallet");
  }

  void openCheckOut() {
    var options = {
      "key": "rzp_test_ELS6PwZccBsH3T",
      "amount": 100 * 100,
      "name": "Sample App",
      "description": "Random Payment",
      "prefill": {
        "contact": "8604722773",
        "email": "sakshamsahu0002@gmail.com"
      },
      "external": {
        "wallets": ["paytm"]
      },
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}

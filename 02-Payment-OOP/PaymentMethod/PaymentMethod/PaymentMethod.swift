import SwiftUI

enum PaymentMethod: String, CaseIterable, Identifiable {
    case paypal = "PayPal"
    case googlePay = "GooglePay"
    case applePay = "ApplePay"

    var id: String { rawValue }

    var logoURL: String {
        switch self {
        case .paypal:
            return "https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg.png"
        case .googlePay:
            return "https://upload.wikimedia.org/wikipedia/commons/c/c7/Google_Pay_Logo_%282020%29.svg.png"
        case .applePay:
            return "https://upload.wikimedia.org/wikipedia/commons/b/b0/Apple_Pay_logo.svg.png"
        }
    }
}


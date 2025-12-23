import SwiftUI

struct ContentView: View {

    @State private var selectedPayment: PaymentMethod? = nil

    var body: some View {
        VStack(spacing: 24) {

            Spacer()

            // HEADER LOGO
            Group {
                if let selectedPayment {
                    RemoteLogoView(urlString: selectedPayment.logoURL)
                        .frame(height: 120)
                        .transition(.scale)
                } else {
                    Image(systemName: "wallet.pass")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(.gray)
                        .opacity(0.6)
                }
            }
            .animation(.easeInOut, value: selectedPayment)

            Divider()
                .padding(.horizontal)

            VStack(spacing: 16) {
                ForEach(PaymentMethod.allCases) { method in
                    PaymentRow(
                        method: method,
                        isSelected: selectedPayment == method
                    ) {
                        selectedPayment = method
                    }
                }
            }
            .padding(.horizontal)

            Spacer()

            Button {
                print("Selected:", selectedPayment?.rawValue ?? "")
            } label: {
                Text("Continue")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.blue, .indigo],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
            }
            .opacity(selectedPayment == nil ? 0.5 : 1)
            .disabled(selectedPayment == nil)
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color(.systemGroupedBackground))
    }
}


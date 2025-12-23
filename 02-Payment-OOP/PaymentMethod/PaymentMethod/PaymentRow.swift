import SwiftUI

struct PaymentRow: View {
    let method: PaymentMethod
    let isSelected: Bool
    let onSelect: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .foregroundColor(.blue)

            RemoteLogoView(urlString: method.logoURL)
                .frame(width: 40, height: 40)

            Text(method.rawValue)
                .font(.headline)

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(isSelected ? Color.blue : Color.gray.opacity(0.4), lineWidth: 1)
        )
        .onTapGesture { onSelect() }
    }
}


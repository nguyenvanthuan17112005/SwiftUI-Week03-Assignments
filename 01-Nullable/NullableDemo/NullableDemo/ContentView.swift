
import SwiftUI

struct ContentView: View {
    @State private var email: String? = nil
    @State private var inputText: String = ""
    var body: some View {
        VStack (spacing: 20){
            Text("Nullable / Optional Demo")
                .font(.title)
                .bold()
            TextField("Nhập email", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Button("Lưu email"){
                email = inputText.isEmpty ? nil : inputText
            }
            Divider()
            Text("Email hiện tại:")
                .font(.headline)
            Text(email ?? "Chưa có email")
                .foregroundColor(email == nil ? .gray : .blue)
        }
        .padding()
    }
}
#Preview {
    ContentView()
}

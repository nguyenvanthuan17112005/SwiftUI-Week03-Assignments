import SwiftUI

struct ContentView: View{
    @State private var email: String? = nil
    @State private var inputText: String = ""
    var body: some View{
        VStack(spacing: 20){
            Text("Nullable / Optional Demo")
                .font(.title)
                .bold()
            TextField("Enter email here: ", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Button("Save email"){
                email = inputText.isEmpty ? nil : inputText
            }
            Divider()
            Text("Present Email")
                .font(.headline)
            Text(email ?? "Not exist email")
                .foregroundColor(email == nil ? .secondary : .primary)
        }
    }
}

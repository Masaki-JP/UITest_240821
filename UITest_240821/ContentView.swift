import SwiftUI

struct ContentView: View {
    @State private var num1: Int?
    @State private var num2: Int?
    @State private var sum: Int?
    @FocusState private var focusedTextField: FocusedTextField?

    enum FocusedTextField {
        case num1, num2
    }

    var body: some View {
        VStack {
            Text("num1:")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("", value: $num1, format: .number)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .focused($focusedTextField, equals: .num1)
                .accessibilityIdentifier("num1TextField")

            Text("num2:")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("", value: $num2, format: .number)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .focused($focusedTextField, equals: .num2)
                .accessibilityIdentifier("num2TextField")

            Button("Caluculate") {
                guard let num1, let num2 else { return }
                sum = num1 + num2
            }
            .buttonStyle(.borderedProminent)
            .tint(sum == nil ? nil : .gray)
            .accessibilityIdentifier("Calculate")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            if let sum {
                Text("sum: " + sum.description)
                    .accessibilityIdentifier("sumLabel")
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedTextField = nil
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    ContentView()
}

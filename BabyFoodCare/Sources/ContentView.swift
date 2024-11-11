import Foundation
import SwiftUI

public struct ContentView: View {
    public init() { }

    public var body: some View {
        HStack {
            Text("Hello", tableName: "MainScreen")
            Button(
                action: {
                    print("Hello")
                }) {
                    Text("Hello", tableName: "MainScreen")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

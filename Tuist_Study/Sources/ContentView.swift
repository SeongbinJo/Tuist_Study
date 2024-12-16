import SwiftUI
import SnapKit

public struct ContentView: View {
    public init() {}

    public var body: some View {
        
        VStack {
            Text("hi")
            Text("Hello, World!")
                .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

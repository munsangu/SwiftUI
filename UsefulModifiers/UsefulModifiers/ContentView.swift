import SwiftUI

struct ContentView: View {
    @State var haptics: Bool = false
    @State var count: Int = 0
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    Text("containerRelativeFrame()")
                        .font(.title2.bold())
                    
                    Rectangle()
                        .containerRelativeFrame(.vertical) { value, _ in
                            value * 0.3
                        }
                }
                .padding()
                
                Divider()
            
                VStack {
                    Text("containerBackground()")
                        .font(.title2.bold())
                    
                    Text("Home")
                        .containerBackground(
                            .clear,
                            for: .navigation
                        )
                }
                .padding()
                
                Divider()
            
                VStack {
                    Text("sensoryFeedback()")
                        .font(.title2.bold())
                    
                    Button("Trigger haptics Feedback") {
                        haptics.toggle()
                    }
                    .sensoryFeedback(
                        .warning,
                        trigger: haptics
                    )
                }
                .padding()
                
                Divider()
                
                VStack {
                    Text("buttonRepeatBehaviour()")
                        .font(.title2.bold())
                    
                    Button("Add to Card \(count)") {
                        count += 1
                    }
                    .buttonRepeatBehavior(.enabled)
                }
                
                Divider()

                VStack {
                    Text("contentMargins()")
                        .font(.title2.bold())
                    
                    Rectangle()
                        .fill(.blue)
                        .containerRelativeFrame(.vertical) { value, _ in
                            value * 3
                        }
                }
                
                Divider()
                
                VStack {
                    Text("SubViews(SubViewCollection)")
                        .font(.title2.bold())
                    
                    let customContent = ForEach(
                        0..<10,
                        id: \.self
                    ) { _ in
                        Rectangle()
                    }
                    
                    Group(subviews: customContent) { collection in
                        Text("The Given view contains \(collection.count) subviews!")
                    }
                }
                .padding()
                
            }
            .navigationTitle("Useful Modifiers")
            .background(.mint)
            .contentMargins(
                .vertical,
                50,
                for: .scrollContent
            )
            .contentMargins(
                .trailing,
                10,
                for: .scrollContent
            )
        }
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct ContentView: View {
    @State private var showView: Bool = false
    @State private var config = StaggeredConfig()
    @State private var sameDirection: Bool = false
    @State private var horizontally: Bool = false
    @State private var scale: CGFloat = 0.95
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack(spacing: 15) {
                        HStack {
                            Text("Same Direction")
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                            
                            Toggle("", isOn: $sameDirection)
                                .labelsHidden()
                                .onChange(of: sameDirection) { _, newValue in
                                    config.disappearInSameDirection = newValue
                                }
                        }
                        
                        HStack {
                            Text("Horizontally")
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                            
                            Toggle("", isOn: $horizontally)
                                .labelsHidden()
                                .onChange(of: horizontally) { _, newValue in
                                    config.offset = newValue ?
                                        CGSize(width: 100, height: 0) :
                                        CGSize(width: 0, height: 100)
                                }
                        }
                    }
                        
                    HStack(spacing: 5) {
                        Text("Scale")
                            .foregroundStyle(.secondary)
                        
                        Slider(value: $scale, in: 0.7...1.0)
                            .onChange(of: scale) { _, newValue in
                                config.scale = newValue
                            }
                    }

                    
                    Button {
                        showView.toggle()
                    } label: {
                        Text("Toggle View")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    StaggeredView(config: config) {
                        if showView {
                            ForEach(1...10, id: \.self) { _ in
                                DummyView()
                            }
                        }
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(15)
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Staggered Animation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func DummyView() -> some View {
        HStack(spacing: 10) {
            Circle()
                .frame(
                    width: 45,
                    height: 45
                )
            
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .padding(
                        .trailing,
                        20
                    )
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .padding(
                        .trailing,
                        140
                    )
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(
                        width: 100,
                        height: 10
                    )
            }
        }
        .foregroundStyle(
            .gray
                .opacity(0.7)
                .gradient
        )
    }
}

#Preview {
    ContentView()
}

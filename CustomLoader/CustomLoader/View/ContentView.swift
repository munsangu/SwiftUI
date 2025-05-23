import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
            ZStack {
                Color("Bg")
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        Rectangle()
                            .fill(Color("Box1"))
                            .frame(
                                width: 100,
                                height: 100
                            )
                            .offset(viewModel.offsets[0])
                    }
                    .frame(
                        width: 210,
                        alignment: .leading
                    )
                    
                    HStack(spacing: 10) {
                        Rectangle()
                            .fill(Color("Box2"))
                            .frame(
                                width: 100,
                                height: 100
                            )
                            .offset(viewModel.offsets[1])
                        
                        Rectangle()
                            .fill(Color("Box3"))
                            .frame(
                                width: 100,
                                height: 100
                            )
                            .offset(viewModel.offsets[2])
                    }
                }
            }
            .onAppear {
                viewModel.doAnimation()
            }
        }
}

#Preview {
    ContentView()
}

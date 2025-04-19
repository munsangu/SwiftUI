import SwiftUI

enum Orientation: String, CaseIterable {
    case all = "All"
    case portrait = "Portrait"
    case landscapeLeft = "Left"
    case landscapeRight = "Right"
    
    var mask: UIInterfaceOrientationMask {
        switch self {
        case .all:
            return .all
        case .portrait:
            return .portrait
        case .landscapeLeft:
            return .landscapeLeft
        case .landscapeRight:
            return .landscapeRight
        }
    }
}

struct ContentView: View {
    @State private var orientation: Orientation = .portrait
    @State private var showFullScreenCover: Bool = false
    var body: some View {
        NavigationStack {
            List {
                Section("Orientation") {
                    Picker(
                        "",
                        selection: $orientation
                    ) {
                        ForEach(
                            Orientation.allCases,
                            id: \.rawValue
                        ) { orientation in
                            Text(orientation.rawValue)
                                .tag(orientation)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(
                        of: orientation,
                        initial: true
                    ) { oldValue, newValue in
                        modifyOrigentation(newValue.mask)
                    }
                }
                
                Section("Actions") {
                    NavigationLink("Detail View") {
                        DetailView(userSelection: orientation)
                    }
                    
                    Button("Show full screen cover") {
                        modifyOrigentation(.landscapeRight)
                        DispatchQueue.main.async {
                            showFullScreenCover.toggle()
                        }
                    }
                }
            }
            .navigationTitle("Manual Orientaion")
            .fullScreenCover(isPresented: $showFullScreenCover) {
                Rectangle()
                    .fill(.red.gradient)
                    .overlay {
                        Text("Hello from full screen cover!")
                    }
                    .ignoresSafeArea()
                    .overlay(alignment: .topLeading) {
                        Button("Close") {
                            modifyOrigentation(orientation.mask)
                            showFullScreenCover.toggle()
                        }
                        .padding(15)
                    }
            }
        }
    }
}

struct DetailView: View {
    var userSelection: Orientation
    @Environment(\.dismiss) private var dismiss
    @State private var isRotated: Bool = false
    var body: some View {
        NavigationLink("Sub-DetailView") {
            Text("Hello from sub-detailView")
                .onAppear {
                    modifyOrigentation(.portrait)
                }
                .onDisappear {
                    modifyOrigentation(.landscapeLeft)
                }
        }
        .onAppear {
            guard !isRotated else { return }
            modifyOrigentation(.landscapeLeft)
            isRotated = true
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Back") {
                    modifyOrigentation(userSelection.mask)
                    DispatchQueue.main.async {
                        dismiss()
                    }
                }
            }
        }
    }
}

extension View {
    func modifyOrigentation(_ mask: UIInterfaceOrientationMask) {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            AppDelegate.origentation = mask
            windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: mask))
            windowScene.keyWindow?.rootViewController?.setNeedsUpdateOfSupportedInterfaceOrientations()
        }
    }
}

#Preview {
    ContentView()
}

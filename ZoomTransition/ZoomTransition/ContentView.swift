import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("With Interactive Dismiss") {
                    Text("Hello From View 1")
                        .navigationTransition(
                            .zoom(
                                sourceID: 1,
                                in: animation
                            )
                        )
                }
                .matchedTransitionSource(
                    id: 1,
                    in: animation
                )
                .listRowBackground(Color.white)
                
                NavigationLink("Without Interactive Dismiss") {
                    Text("Hello From View 2")
                        .navigationTransition(
                            .zoom(
                                sourceID: 2,
                                in: animation
                            )
                        )
                        .disableZoomInteractiveDismiiss()
                }
                .matchedTransitionSource(
                    id: 2,
                    in: animation
                )
                .listRowBackground(Color.white)
            }
            .navigationTitle("Zoom Transition")
        }
    }
}

extension View {
    func disableZoomInteractiveDismiiss() -> some View {
        self
            .background(RemoveZoomDismissGestures())
    }
}

fileprivate struct RemoveZoomDismissGestures: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        removeGestures(from: view)
        return view
    }
    
    func updateUIView(
        _ uiView: UIView,
        context: Context
    ) {
        
    }
    
    private func removeGestures(from view: UIView) {
        DispatchQueue.main.async {
            if let zoomViewControllerView = view.viewController?.view {
                zoomViewControllerView.gestureRecognizers?.removeAll {
                    ($0.name ?? "").contains("ZoomInteractive")
                }
            }
        }
    }
}

extension UIView {
    var viewController: UIViewController? {
        sequence(first: self) { $0.next }
            .compactMap({ $0 as? UIViewController })
            .first
    }
}

#Preview {
    ContentView()
}

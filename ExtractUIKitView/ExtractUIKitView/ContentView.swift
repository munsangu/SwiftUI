import SwiftUI

struct ContentView: View {
    var body: some View {
        //TextField("Hello World!", text: .constant(""))
        //    .viewExtractor { view in
        //        if let textField = view as? UITextField {
        //            print(textField)
        //        }
        //    }
        //
        //Slider(value: .constant(0.2))
        //    .viewExtractor { view in
        //        if let slider = view as? UISlider {
        //            slider.tintColor = .red
        //            slider.thumbTintColor = .systemBlue
        //        }
        //    }
        //List {
        //    Text("Hello Word!")
        //}
        //.viewExtractor { view in
        //    if let list = view as? UICollectionView {
        //        print(list)
        //    }
        //}
        //ScrollView {
        //    Text("Hello World!")
        //        .viewExtractor { view in
        //            if let scrollview = view as? UIScrollView {
        //                scrollview.bounces = false
        //            }
        //        }
        //}
        
        NavigationStack {
            List {
                
            }
            .navigationTitle("Home")
        }
        .viewExtractor { view in
            if let navController = view.next as? UINavigationController {
                print(navController)
            }
        }
        
        TabView {
            
        }
        .viewExtractor { view in
            if let tabController = view.next as? UITabBarController {
                tabController.tabBar.isHidden = true
            }
        }
    }
}

extension View {
    @ViewBuilder
    func viewExtractor(result: @escaping (UIView) -> ()) -> some View {
        self
            .background(ViewExtractHelper(result: result))
            .compositingGroup()
    }
}

fileprivate struct ViewExtractHelper: UIViewRepresentable {
    var result: (UIView) -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        
        DispatchQueue.main.async {
            if let uiKitview = view.superview?.superview?.subviews.last?.subviews.first {
                result(uiKitview)
            }
        }
        
        return view
    }
    
    func updateUIView(
        _ uiView: UIView,
        context: Context
    ) {
        
    }
}

#Preview {
    ContentView()
}

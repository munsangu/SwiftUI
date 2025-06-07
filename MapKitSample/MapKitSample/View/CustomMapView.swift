import SwiftUI
import MapKit

struct CustomMapView: View {
    @StateObject private var viewModel = MapKitSampleViewModel()
    
    var body: some View {
        Group {
            if #available(iOS 17.0, *) {
                CustomMapView_iOS17(viewModel: viewModel)
            } else {
                CustomMapView_iOS16(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    CustomMapView()
}

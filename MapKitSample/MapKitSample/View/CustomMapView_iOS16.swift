import SwiftUI
import MapKit

struct CustomMapView_iOS16: View {
    @ObservedObject var viewModel: MapKitSampleViewModel
    var body: some View {
        Map(
            coordinateRegion: $viewModel.region,
            showsUserLocation: true,
            annotationItems: viewModel.locations
        ) { location in
            MapAnnotation(coordinate: location.coordinate) {
                VStack {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title)
                        .foregroundStyle(.red)
                    
                    Text(location.name)
                        .font(.caption)
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(radius: 2)
                }
                .onTapGesture {
                    viewModel.selectedLocation(location)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .overlay(alignment: .bottom) {
            if let selectedLocation = viewModel.selectedLocation {
                LocationInfoView(location: selectedLocation)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

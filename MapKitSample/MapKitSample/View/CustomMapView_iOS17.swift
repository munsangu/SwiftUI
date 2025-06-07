import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct CustomMapView_iOS17: View {
    @ObservedObject var viewModel: MapKitSampleViewModel
    @State private var mapCameraPosition: MapCameraPosition = .automatic
    var body: some View {
        Map(position: $mapCameraPosition) {
            UserAnnotation()
            
            ForEach(viewModel.locations) { location in
                Annotation(location.name, coordinate: location.coordinate) {
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
                        withAnimation {
                            mapCameraPosition = .region(MKCoordinateRegion(
                                center: location.coordinate,
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            ))
                        }
                    }
                }
            }
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
        }
        .onAppear {
            mapCameraPosition = .region(viewModel.region)
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

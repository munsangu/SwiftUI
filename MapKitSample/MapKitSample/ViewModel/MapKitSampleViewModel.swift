import SwiftUI
import MapKit
import CoreLocation

class MapKitSampleViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.3346,
            longitude: -122.0090
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05
        )
    )
    @Published var locations: [Location] = []
    @Published var selectedLocation: Location?
    @Published var userLocation: CLLocationCoordinate2D?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        locations = [
            Location(
                name: "Apple Park",
                coordinate: CLLocationCoordinate2D(
                    latitude: 37.3346,
                    longitude: -122.0090
                )
            ),
            Location(
                name: "Stanford University",
                coordinate: CLLocationCoordinate2D(
                    latitude: 37.4275,
                    longitude: -122.1697
                )
            ),
        ]
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else { return }
        userLocation = location.coordinate
        
        if region.center.latitude == 37.3346 {
            withAnimation {
                region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.05,
                        longitudeDelta: 0.05
                    )
                )
            }
        }
    }
    
    func selectedLocation(_ location: Location) {
        selectedLocation = location
        withAnimation {
            region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.05,
                    longitudeDelta: 0.05
                )
            )
        }
    }
    
}

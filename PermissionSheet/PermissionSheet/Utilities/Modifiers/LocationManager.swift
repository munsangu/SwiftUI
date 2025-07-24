import Foundation
import CoreLocation

@MainActor
@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    var status: CLAuthorizationStatus?
    var manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
    }
    
    func requestWhenInUseAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
}

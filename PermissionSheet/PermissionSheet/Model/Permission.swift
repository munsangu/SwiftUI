import Foundation
import CoreLocation
import PhotosUI
import AVKit

enum Permission: String, CaseIterable {
    case location = "Location Services"
    case camera = "Camera Access"
    case microphone = "Microphone Access"
    case photoLibrary = "Photo Library Access"
    
    var symbol: String {
        switch self {
        case .location: "location.fill"
        case .camera: "camera.fill"
        case .microphone: "microphone.fill"
        case .photoLibrary: "photo.stack.fill"
        }
    }
    
    var orderedIndex: Int {
        switch self {
        case .camera: 0
        case .microphone: 1
        case .photoLibrary: 2
        case .location: 3
        }
    }
    
    var isGranted: Bool? {
        switch self {
        case .location:
            let status = CLLocationManager().authorizationStatus
            return status == .notDetermined ? nil : status == .authorizedAlways || status == .authorizedWhenInUse
        case .camera:
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            return status == .notDetermined ? nil : status == .authorized
        case .microphone:
            let status = AVCaptureDevice.authorizationStatus(for: .audio)
            return status == .notDetermined ? nil : status == .authorized
        case .photoLibrary:
            let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            return status == .notDetermined ? nil : status == .authorized || status == .limited
        }
    }
}

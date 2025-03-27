import SwiftUI

enum AppConstants {
    
    enum Animation {
        static let waveCycleDuration: Double = 2.0
        static let defaultDuration: Double = 0.3
    }
    
    enum Layout {
        static let defaultPadding: CGFloat = 16.0
        static let cornerRadius: CGFloat = 12.0
        
        enum WaveAmplitude {
            static let primary: CGFloat = 150.0
            static let secondary: CGFloat = 140.0
        }
    }
    
    enum Strings {
        static let appTitle = "Wave's"
    }
}

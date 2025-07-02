import Foundation

enum MVCType: String, Identifiable, CaseIterable {
    case model = "Model"
    case view = "View"
    case controller = "Controller"
    
    var id: String { self.rawValue }
    
    var description: String {
        switch self {
        case .model:
            return "Manages data and business logic, stores application state."
        case .view:
            return "Presents UI to the user and receives user input."
        case .controller:
            return "Receives user input, updates Model, and updates the View."
        }
    }
}

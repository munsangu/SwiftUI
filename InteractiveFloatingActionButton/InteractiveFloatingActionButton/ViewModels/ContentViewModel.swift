import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published private(set) var colors: [Color] = [
        .red, .blue, .green, .yellow, .cyan,
        .brown, .orange, .pink, .purple, .indigo, .mint
    ]
    
    var trayActionModel: FloatingActionModel {
        FloatingActionModel(symbol: "tray.full.fill", action: trayAction)
    }

    var sparkActionModel: FloatingActionModel {
        FloatingActionModel(symbol: "lasso.badge.sparkles", action: sparkAction)
    }
    
    var shareActionModel: FloatingActionModel {
        FloatingActionModel(symbol: "square.and.arrow.up.fill", action: shareAction)
    }
    
    func trayAction() {
        Logger.log("Tray action selected")
    }
    
    func sparkAction() {
        Logger.log("Spark action selected")
    }
    
    func shareAction() {
        Logger.log("Share action selected")
    }
}

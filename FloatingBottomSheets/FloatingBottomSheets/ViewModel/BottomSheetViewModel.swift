import SwiftUI

class BottomSheetViewModel: ObservableObject {
    @Published var isSheetPresented: Bool = false
    @Published var currentSheetType: SheetType = .question
    
    func showSheet(type: SheetType) {
        currentSheetType = type
        isSheetPresented = true
    }
    
    func dismissSheet() {
        isSheetPresented = false
    }
    
    var currentSheetConfiguration: SheetConfiguration {
        currentSheetType.configuration
    }
}

import SwiftUI

class DropdownViewModel: ObservableObject {
    private static let dropdownItemsList: [String] = [
        "YouTube", "Google", "Apple", "Facebook", "Twitter", "Tiktok"
    ]
    
    @Published var items: [DropdownItem]
    @Published var activeItem: String?
    
    init(initialSelection: String? = nil) {
        self.items = DropdownViewModel.dropdownItemsList.map { DropdownItem(text: $0) }
    }
    
    var pickerValues: [String] {
        return DropdownViewModel.dropdownItemsList
    }
    
    var defaultSelection: String {
        return DropdownViewModel.dropdownItemsList.first ?? ""
    }
}

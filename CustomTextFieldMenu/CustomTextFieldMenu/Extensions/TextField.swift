import SwiftUI

extension TextField {
    @ViewBuilder
    func menu(
        showSuggestions: Bool,
        @TextFieldActionBuilder actions: @escaping () -> [TextFieldAction]
    ) -> some View {
        self
            .background(
                TextFieldActionHelper(
                    showSuggestions: showSuggestions,
                    actions: actions()
                )
            )
            .compositingGroup()
    }
}

import SwiftUI

final class ObjectSimulatorViewModel: ObservableObject {
    @Published var original: ObjectBox
    @Published var copied: ObjectBox?
    @Published var showArrow: Bool = false

    init() {
        self.original = ObjectBox(
            name: "Original",
            value: 1,
            kind: .structType
        )
    }

    func simulateCopy() {
        showArrow = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if self.original.kind == .structType {
                self.copied = ObjectBox(
                    name: "Copy",
                    value: self.original.value,
                    kind: self.original.kind
                )
            } else {
                self.copied = self.original
            }
            self.showArrow = true
        }
    }

    func toggleKind() {
        original.kind = (original.kind == .structType) ? .classType : .structType
        copied = nil
        showArrow = false
    }
}

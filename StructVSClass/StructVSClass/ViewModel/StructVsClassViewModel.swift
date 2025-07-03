import Foundation

class StructVsClassViewModel: ObservableObject {
    @Published var isShowingCommon = true

    let items: [InfoItem] = [
        InfoItem(
            title: "Properties and Methods",
            description: "Both can define properties and methods.",
            isCommon: true
        ),
        InfoItem(
            title: "Initializers",
            description: "Both can use initializers to set default values.",
            isCommon: true
        ),

        InfoItem(
            title: "Value Type",
            description: "Structs are copied when passed.",
            isCommon: false
        ),
        InfoItem(
            title: "Reference Type",
            description: "Classes are passed by reference.",
            isCommon: false
        ),
        InfoItem(
            title: "Inheritance",
            description: "Structs do not support inheritance, but classes do.",
            isCommon: false
        ),
        InfoItem(
            title: "Deinitializer",
            description: "Only classes support deinit.",
            isCommon: false
        )
    ]

    var filteredItems: [InfoItem] {
        items.filter { $0.isCommon == isShowingCommon }
    }

    func toggleView() {
        isShowingCommon.toggle()
    }
}

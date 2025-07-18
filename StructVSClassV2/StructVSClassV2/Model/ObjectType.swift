import Foundation

enum ObjectKind {
    case structType
    case classType
}

struct ObjectBox: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var value: Int
    var kind: ObjectKind
}

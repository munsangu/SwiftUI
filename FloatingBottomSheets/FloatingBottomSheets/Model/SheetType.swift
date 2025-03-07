import SwiftUI

enum SheetType {
    case alert
    case question
    case request
}

extension SheetType {
    var configuration: SheetConfiguration {
        switch self {
        case .alert:
            return SheetConfiguration(
                title: "Ooops!",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                image: IconConfig(
                    content: "exclamationmark.triangle.fill",
                    tint: .red,
                    foreground: .white
                ),
                primaryButton: ButtonConfig(
                    content: "Done",
                    tint: .red,
                    foreground: .white
                ),
                secondaryButton: nil
            )
            
        case .question:
            return SheetConfiguration(
                title: "Replace Existing Folder?",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                image: IconConfig(
                    content: "questionmark.folder.fill",
                    tint: .blue,
                    foreground: .white
                ),
                primaryButton: ButtonConfig(
                    content: "Replace",
                    tint: .blue,
                    foreground: .white
                ),
                secondaryButton: ButtonConfig(
                    content: "Cancel",
                    tint: Color.primary.opacity(0.08),
                    foreground: Color.primary
                )
            )
            
        case .request:
            return SheetConfiguration(
                title: "Request from iJustine",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                image: IconConfig(
                    content: "person.crop.circle.fill.badge.questionmark",
                    tint: .green,
                    foreground: .white
                ),
                primaryButton: ButtonConfig(
                    content: "Accept",
                    tint: .green,
                    foreground: .white
                ),
                secondaryButton: ButtonConfig(
                    content: "Reject",
                    tint: .red,
                    foreground: .white
                )
            )
        }
    }
}

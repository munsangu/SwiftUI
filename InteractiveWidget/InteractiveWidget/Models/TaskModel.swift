import SwiftUI

struct TaskModel: Identifiable {
    var id: String = UUID().uuidString
    var taskTitle: String
    var isCompleted: Bool = false
}

class TaskDataModel {
    static let shared = TaskDataModel()
    
    var tasks: [TaskModel] = [
        .init(taskTitle: "Learn SwiftUI"),
        .init(taskTitle: "Workout for my health"),
        .init(taskTitle: "Mind control"),
    ]
}

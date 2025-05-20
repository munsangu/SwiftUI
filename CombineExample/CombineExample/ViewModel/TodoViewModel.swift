import SwiftUI
import Combine

class TodoViewModel: ObservableObject {
    @Published var newTodoText: String = ""
    @Published private(set) var todos: [Todo] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        $newTodoText
            .sink { text in
                print("Written Text: \(text)")
            }
            .store(in: &cancellables)
    }

    func addTodo() {
        guard !newTodoText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let todo = Todo(title: newTodoText, isDone: false)
        todos.append(todo)
        newTodoText = ""
    }

    func toggleTodo(_ todo: Todo) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[index].isDone.toggle()
    }

    func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

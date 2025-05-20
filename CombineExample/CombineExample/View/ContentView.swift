import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
       var body: some View {
           NavigationView {
               VStack {
                   HStack {
                       TextField("To do input", text: $viewModel.newTodoText)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                       Button("Add") {
                           viewModel.addTodo()
                       }
                   }
                   .padding()

                   List {
                       ForEach(viewModel.todos) { todo in
                           HStack {
                               Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle")
                                   .onTapGesture {
                                       viewModel.toggleTodo(todo)
                                   }
                               Text(todo.title)
                                   .strikethrough(todo.isDone)
                           }
                       }
                       .onDelete(perform: viewModel.deleteTodo)
                   }
               }
               .navigationTitle("Todo List")
           }
       }
}

#Preview {
    ContentView()
}

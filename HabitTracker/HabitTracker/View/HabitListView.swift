import SwiftUI

struct HabitListView: View {
    @StateObject private var viewModel = HabitViewModel()
    @State private var newHabitName: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New habit", text: $newHabitName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)

                    Button(action: {
                        viewModel.addHabit(name: newHabitName)
                        newHabitName = ""
                    }) {
                        Image(systemName: "plus")
                            .padding(8)
                    }
                    .disabled(newHabitName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(.vertical)

                List {
                    ForEach(viewModel.habits) { habit in
                        HabitRowView(habit: habit) {
                            viewModel.toggleHabit(habit)
                        }
                    }
                    .onDelete(perform: viewModel.deleteHabit)
                }
            }
            .navigationTitle("My Habits")
            .toolbar {
                EditButton()
                Button("Reset") {
                    viewModel.resetAllHabits()
                }
            }
        }
    }
}

#Preview {
    HabitListView()
}

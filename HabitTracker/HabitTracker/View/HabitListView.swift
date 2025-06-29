import SwiftUI

struct HabitListView: View {
    @StateObject private var viewModel = HabitViewModel()
    @State private var newHabitName: String = ""
    @State private var selectedHour: Int = 9
    @State private var selectedMinute: Int = 0
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField(
                        "New habit",
                        text: $newHabitName
                    )
                        .textFieldStyle(.roundedBorder)
                        .frame(minWidth: 150)
                    
                    Picker(
                        "",
                        selection: $selectedHour
                    ) {
                        ForEach(
                            0..<24,
                            id: \.self
                        ) {
                            Text("\($0)h")
                        }
                    }
                    .frame(width: 60)
                    
                    Picker(
                        "",
                        selection: $selectedMinute
                    ) {
                        ForEach(
                            [0, 15, 30, 45],
                            id: \.self
                        ) {
                            Text("\($0)m")
                        }
                    }
                    .frame(width: 60)

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

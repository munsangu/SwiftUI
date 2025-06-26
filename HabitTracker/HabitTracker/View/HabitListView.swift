import SwiftUI

struct HabitListView: View {
    @StateObject private var viewModel = HabitViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.habits) { habit in
                    HabitRowView(habit: habit) {
                        viewModel.toggleHabit(habit)
                    }
                }
            }
            .navigationTitle("My Habits")
            .toolbar {
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

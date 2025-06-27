import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let toggleAction: () -> Void
    var body: some View {
        HStack {
            Text(habit.name)
            
            Spacer()
            
            Button(action: {
                toggleAction()
            }) {
                Image(systemName: habit.isCompletedToday ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(habit.isCompletedToday ? .green : .gray)
                    .accessibilityLabel(habit.isCompletedToday ? "Mark as not completed" : "Mark as completed")
            }
            .buttonStyle(.plain)
        }
        .padding(
            .vertical,
            8
        )
    }
}

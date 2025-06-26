import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let toggleAction: () -> Void
    var body: some View {
        HStack {
            Text(habit.name)
            
            Spacer()
            
            Image(systemName: habit.isCompletedToday ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(habit.isCompletedToday ? .green : .gray)
                .onTapGesture {
                    toggleAction()
                }
        }
        .padding(
            .vertical,
            8
        )
    }
}

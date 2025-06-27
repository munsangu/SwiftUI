import Foundation

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    
    private let storageKey = "habits_storage"
    private let lastResetDateKey = "last_reset_date"
    
    init() {
        checkAndResetIfNeeded()
        loadHabits()
    }
    
    func toggleHabit(_ habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id }) else { return }
        habits[index].isCompletedToday.toggle()
        saveHabits()
    }
    
    func resetAllHabits() {
        for index in habits.indices {
            habits[index].isCompletedToday = false
        }
        
        saveHabits()
    }
    
    private func checkAndResetIfNeeded() {
        let now = Date()
        let lastResetDate = UserDefaults.standard.object(forKey: lastResetDateKey) as? Date ?? Date.distantPast
        let calendar = Calendar.current

        if !calendar.isDate(now, inSameDayAs: lastResetDate) {
            print("🌀 A new day has started — resetting all habit states.")
            resetAllHabits()
        }
    }
    
    func loadHabits() {
        self.habits = [
            Habit(name: "Drink Water"),
            Habit(name: "Read 10 Pages"),
            Habit(name: "Stretch 5 Minutes"),
        ]
//        if let data = UserDefaults.standard.data(forKey: storageKey),
//           let decoded = try? JSONDecoder().decode(
//            [Habit].self,
//            from: data
//           )
//        {
//            self.habits = decoded
//        } else {
//            self.habits = [
//                Habit(name: "Drink Water"),
//                Habit(name: "Read 10 Pages"),
//                Habit(name: "Stretch 5 Minutes"),
//            ]
//        }
    }
    
    func saveHabits() {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(
                encoded,
                forKey: storageKey
            )
        }
    }
}

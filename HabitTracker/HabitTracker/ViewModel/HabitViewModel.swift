import Foundation

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    
    private let storageKey = "habits_storage"
    
    init() {
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
    
    func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode(
            [Habit].self,
            from: data
           )
        {
            self.habits = decoded
        } else {
            self.habits = [
                Habit(name: "Drink Water"),
                Habit(name: "Read 10 Pages"),
                Habit(name: "Stretch 5 Minutes"),
            ]
        }
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

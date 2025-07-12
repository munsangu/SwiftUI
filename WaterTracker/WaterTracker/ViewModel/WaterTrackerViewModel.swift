import Foundation

class WaterTrackerViewModel: ObservableObject {
    @Published var glasses: [WaterGlass]
    @Published var totalDrunk: Int = 0
    let goal: Int = 2000

    init() {
        self.glasses = Array(
            repeating:
                WaterGlass(
                    amount: 250,
                    isDrunk: false
                ),
            count: 8
        )
    }

    var remaining: Int {
        max(goal - totalDrunk, 0)
    }

    var progress: Double {
        Double(totalDrunk) / Double(goal)
    }

    func toggleGlass(at index: Int) {
        guard glasses.indices.contains(index) else { return }
        if glasses[index].isDrunk {
            totalDrunk -= glasses[index].amount
        } else {
            totalDrunk += glasses[index].amount
        }
        glasses[index].isDrunk.toggle()
    }
}

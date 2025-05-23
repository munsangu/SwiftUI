import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var offsets: [CGSize] = Array(repeating: .zero, count: 3)
    
    private var delayTime: Double = 0
    private var timerSubscription: Cancellable?
    
    let locations: [CGSize] = [
        CGSize(width: 110, height: 0),
        CGSize(width: 0, height: -110),
        CGSize(width: -110, height: 0),
        
        CGSize(width: 110, height: 110),
        CGSize(width: 110, height: -110),
        CGSize(width: -110, height: -110),
        
        CGSize(width: 0, height: 110),
        CGSize(width: 110, height: 0),
        CGSize(width: 0, height: -110),
        
        CGSize(width: 0, height: 0),
        CGSize(width: 0, height: 0),
        CGSize(width: 0, height: 0),
    ]
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
        timerSubscription = timer.sink { [weak self] _ in
            self?.delayTime = 0
            self?.doAnimation()
        }
    }
    
    func doAnimation() {
        var tempOffsets: [[CGSize]] = []
        var currentSet: [CGSize] = []
        
        for value in locations {
            currentSet.append(value)
            if currentSet.count == 3 {
                tempOffsets.append(currentSet)
                currentSet.removeAll()
            }
        }
        
        if !currentSet.isEmpty {
            tempOffsets.append(currentSet)
        }
        
        for offset in tempOffsets {
            for index in offset.indices {
                doAnimation(
                    delay: .now() + delayTime,
                    value: offset[index],
                    index: index
                )
                delayTime += 0.3
            }
        }
    }
    
    private func doAnimation(
        delay: DispatchTime,
        value: CGSize,
        index: Int
    ) {
        DispatchQueue.main.asyncAfter(deadline: delay) { [weak self] in
            withAnimation(.easeInOut(duration: 0.5)) {
                self?.offsets[index] = value
            }
        }
    }
}

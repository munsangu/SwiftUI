import Foundation
import Combine

class TOTPViewModel: ObservableObject {
    @Published private(set) var code = ""
    @Published private(set) var remaining = 30

    private let gen: TOTPGenerator
    private let period: Int
    private var bag: AnyCancellable?

    init(secretBase32: String) {
        self.gen = try! TOTPGenerator(
            secretBase32: secretBase32,
            digits: 6,
            period: 30,
            algorithm: .sha1
        )
        self.period = 30
        
        tick(Date())
        
        bag = Timer.publish(
            every: 1,
            on: .main,
            in: .common
        )
            .autoconnect()
            .sink { [weak self] now in self?.tick(now) }
    }

    private func tick(_ now: Date) {
        let t = Int(now.timeIntervalSince1970)
        let elapsed = t % period
        let remain = period - elapsed
        
        if code.isEmpty || remain == period {
            code = gen.generate(at: now)
        }
        
        remaining = remain
    }
}

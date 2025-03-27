import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var colorToggleEnabled: Bool = false
    @Published private(set) var waves: [WaveModel]
    private var cancellables = Set<AnyCancellable>()
    
    init(waves: [WaveModel] = WaveModel.defaultWaves()) {
        self.waves = waves
        setupBindings()
    }
    
    private func setupBindings() {
        $colorToggleEnabled
            .sink { [weak self] toggleEnabled in
                self?.updateWaveColors(toggleEnabled: toggleEnabled)
            }
            .store(in: &cancellables)
    }

    private func updateWaveColors(toggleEnabled: Bool) {
        guard waves.count > 1 else { return }
        
        var updatedWaves = waves
        let secondWaveIndex = 1
        
        if toggleEnabled {
            updatedWaves[secondWaveIndex].color = .purple.opacity(0.4)
        } else {
            updatedWaves[secondWaveIndex].color = .cyan.opacity(0.4)
        }
        
        self.waves = updatedWaves
    }
}

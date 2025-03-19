import SwiftUI

class TransactionViewModel: ObservableObject {
    @Published var transactionState: TransactionState = .idle
    
    var buttonConfig: AnimatedButton.Config {
        AnimatedButton.Config(
            title: transactionState.rawValue,
            foregroundStyle: .white,
            background: transactionState.color,
            symbolImage: transactionState.image
        )
    }
    
    func processTransaction() async {
        await updateState(to: .analyzing)
        try? await Task.sleep(for: .seconds(3))
        
        await updateState(to: .processing)
        try? await Task.sleep(for: .seconds(3))
        
        await updateState(to: .failed)
        try? await Task.sleep(for: .seconds(1))
        
        await updateState(to: .idle)
    }
    
    @MainActor
    private func updateState(to newState: TransactionState) {
        self.transactionState = newState
    }
}

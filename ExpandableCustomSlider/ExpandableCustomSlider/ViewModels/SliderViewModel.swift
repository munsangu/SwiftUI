import Foundation
import SwiftUI

class SliderViewModel: ObservableObject {
    @Published private var model: SliderModel
    @Published var value: CGFloat {
        didSet {
            model.value = value
            if value < model.range.lowerBound {
                value = model.range.lowerBound
            } else if value > model.range.upperBound {
                value = model.range.upperBound
            }
        }
    }
    
    var range: ClosedRange<CGFloat> {
        model.range
    }

    var config: SliderConfig {
        model.config
    }
    
    var formattedValue: String {
        String(format: "%.1f", value) + "%"
    }
    
    var normalizedValue: CGFloat {
        value / model.range.upperBound
    }
    
    init(model: SliderModel = SliderModel()) {
        self.model = model
        self.value = model.value
    }
    
    func updateValue(_ newValue: CGFloat) {
        value = max(min(newValue, model.range.upperBound), model.range.lowerBound)
    }
     
    func updateConfig(config: SliderConfig) {
        model.config = config
        objectWillChange.send()
    }
}

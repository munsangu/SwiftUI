import XCTest
@testable import TipCalculator

final class CalculationTests: XCTestCase {
    func testSuccessfulTipCalculation() {
        // Given(Arrange)
        let enteredAmount = 100.0
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When(Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then(Assert)
        XCTAssertEqual(tip, 25)
    }
    
    func testNegativeEnteredAmountTipCalculation() {
        // Given(Arrange)
        let enteredAmount = -100.0
        let tipSlider = 25.0
        let calculation = Calculation()
        
        // When(Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then(Assert)
        XCTAssertNil(tip)
    }
}

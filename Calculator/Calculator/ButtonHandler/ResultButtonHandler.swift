import UIKit
struct ResultButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = ResultButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        return
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        viewController.pushInputToHistoryStack()
        showCalculationResult(viewController: viewController, button: button)
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        showCalculationResult(viewController: viewController, button: button)
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        viewController.pushInputToHistoryStack()
        showCalculationResult(viewController: viewController, button: button)
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
    
    private func showCalculationResult(viewController: ViewController, button: UIButton) {
        viewController.operatorLabel.text = ""
        
        let parsingResult = ExpressionParser.parse(from: viewController.allHistory)
        
        var formulaResult = 0.0
        
        switch parsingResult {
        case .success(var formula):
            formulaResult = formula.result()
        default:
            return
        }
        
        var result = ""
        if formulaResult == Double.infinity {
            result = "NaN"
        } else {
            result = convertToDeicmalString(from: formulaResult) ?? ""
        }
        
        viewController.valueLabel.text = result
        
        viewController.currentPhase = .phase4
    }
    
    private func convertToDeicmalString(from formulaResult: Double) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter.string(from: NSNumber(value: formulaResult))
    }
}


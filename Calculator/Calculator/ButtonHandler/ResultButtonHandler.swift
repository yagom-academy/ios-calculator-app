import UIKit
struct ResultButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = ResultButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        return
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        viewController.pushNewHistoryToStack()
        showCalculationResult(viewController: viewController, button: button)
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        showCalculationResult(viewController: viewController, button: button)
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        viewController.pushNewHistoryToStack()
        showCalculationResult(viewController: viewController, button: button)
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
    
    private func showCalculationResult(viewController: ViewController, button: UIButton) {
        viewController.operatorLabel.text = ""
        
        let parsedInputHistory = ExpressionParser.parse(from: viewController.allHistory)
        
        var calculationResult = 0.0
        switch parsedInputHistory {
        case .success(var formula):
            calculationResult = formula.result()
        default:
            return
        }

        if calculationResult == Double.infinity {
            viewController.valueLabel.text = "NaN"
        } else {
            viewController.valueLabel.text = convertToDeicmalString(from: calculationResult) ?? ""
        }

        viewController.currentPhase = .phase4
    }
    
    private func convertToDeicmalString(from calculationResult: Double) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter.string(from: NSNumber(value: calculationResult))
    }
}


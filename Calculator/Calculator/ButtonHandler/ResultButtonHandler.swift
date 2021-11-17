import UIKit
struct ResultButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = ResultButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        return
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        viewController.addInputHistory()
        viewController.operatorLabel.text = ""
        
        let parsingResult = ExpressionParser.parse(from: viewController.allHistory)
        
        switch parsingResult {
        case .success(var formula):
            let result = formula.result()
            viewController.valueLabel.text = (result == Double.infinity) ? "NaN" : String(result)
        default:
            break
        }
        
        viewController.currentPhase = .phase4
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        viewController.operatorLabel.text = ""
        
        let parsingResult = ExpressionParser.parse(from: viewController.allHistory)
        
        switch parsingResult {
        case .success(var formula):
            let result = formula.result()
            viewController.valueLabel.text = (result == Double.infinity) ? "NaN" : String(result)
        default:
            break
        }
        
        viewController.currentPhase = .phase4
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        viewController.addInputHistory()
        viewController.operatorLabel.text = ""
        
        let parsingResult = ExpressionParser.parse(from: viewController.allHistory)
        
        switch parsingResult {
        case .success(var formula):
            let result = formula.result()
            viewController.valueLabel.text = (result == Double.infinity) ? "NaN" : String(result)
        default:
            break
        }
        
        viewController.currentPhase = .phase4
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
}


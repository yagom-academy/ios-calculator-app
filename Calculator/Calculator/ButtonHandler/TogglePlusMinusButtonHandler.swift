import UIKit
struct TogglePlusMinusButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = TogglePlusMinusButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        return
    }
    
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        let value = viewController.valueLabel.text ?? ""
        
        if value.first == Operator.subtract.rawValue {
            viewController.valueLabel.text?.removeFirst()
        } else {
            viewController.valueLabel.text = String(Operator.subtract.rawValue) + value
        }
    }
    
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        return
    }
    
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        runActionInPhase1(viewController: viewController, button: button)
    }
    
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
}


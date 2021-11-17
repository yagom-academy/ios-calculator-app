import UIKit
struct AllClearButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = AllClearButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        return
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = "0"
        viewController.operatorLabel.text = ""
        viewController.clearInputHistory()
        viewController.currentPhase = .phase0
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = "0"
        viewController.operatorLabel.text = ""
        viewController.clearInputHistory()
        viewController.currentPhase = .phase0
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = "0"
        viewController.operatorLabel.text = ""
        viewController.clearInputHistory()
        viewController.currentPhase = .phase0
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = "0"
        viewController.operatorLabel.text = ""
        viewController.clearInputHistory()
        viewController.currentPhase = .phase0
    }
}

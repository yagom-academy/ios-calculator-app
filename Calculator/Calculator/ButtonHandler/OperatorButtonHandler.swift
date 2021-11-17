import UIKit
struct OperatorButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = OperatorButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        return
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        viewController.addInputHistory()
        viewController.operatorLabel.text = button.titleLabel?.text
        viewController.valueLabel.text = "0"
        viewController.currentPhase = .phase2
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        viewController.operatorLabel.text = button.titleLabel?.text
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        viewController.addInputHistory()
        viewController.operatorLabel.text = button.titleLabel?.text
        viewController.valueLabel.text = "0"
        viewController.currentPhase = .phase2
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
}

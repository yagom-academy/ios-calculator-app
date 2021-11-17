import UIKit
struct ClearButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = ClearButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        return
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = "0"
        viewController.currentPhase = .phase0
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        return
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = "0"
        viewController.currentPhase = .phase2
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
}


import UIKit
struct NumberButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = NumberButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = button.titleLabel?.text
        viewController.currentPhase = .phase1
    }
    
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        guard let currentValue = viewController.valueLabel.text else { return }
        guard let followingValue = button.titleLabel?.text else { return }
        
        viewController.valueLabel.text = currentValue + followingValue
    }
    
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = button.titleLabel?.text
        viewController.currentPhase = .phase3
    }
    
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        runActionInPhase1(viewController: viewController, button: button)
    }
    
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
}

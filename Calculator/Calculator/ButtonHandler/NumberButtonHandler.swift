import UIKit
struct NumberButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = NumberButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        viewController.inputLabel.text = button.titleLabel?.text
        viewController.currentPhase = .EmptyScrollViewWithInput
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        guard let currentText = viewController.inputLabel.text else { return }
        guard let buttonTitle = button.titleLabel?.text else { return }
        
        viewController.inputLabel.text = currentText + buttonTitle
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        viewController.inputLabel.text = button.titleLabel?.text
        viewController.currentPhase = .NotEmptyScrollViewWithInput
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        guard let currentText = viewController.inputLabel.text else { return }
        guard let buttonTitle = button.titleLabel?.text else { return }
        
        viewController.inputLabel.text = currentText + buttonTitle
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
}

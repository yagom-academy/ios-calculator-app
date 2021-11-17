import UIKit
struct NumberButtonHandler: ButtonActionDelegate {
    static let shared: ButtonActionDelegate = NumberButtonHandler()

    private init() { }
    
    func runActionInPhase0(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = button.titleLabel?.text
        viewController.currentPhase = .EmptyScrollViewWithInput
    }
    func runActionInPhase1(viewController: ViewController, button: UIButton) {
        guard let currentText = viewController.valueLabel.text else { return }
        guard let buttonTitle = button.titleLabel?.text else { return }
        
        viewController.valueLabel.text = currentText + buttonTitle
    }
    func runActionInPhase2(viewController: ViewController, button: UIButton) {
        viewController.valueLabel.text = button.titleLabel?.text
        viewController.currentPhase = .NotEmptyScrollViewWithInput
    }
    func runActionInPhase3(viewController: ViewController, button: UIButton) {
        guard let currentText = viewController.valueLabel.text else { return }
        guard let buttonTitle = button.titleLabel?.text else { return }
        
        viewController.valueLabel.text = currentText + buttonTitle
    }
    func runActionInPhase4(viewController: ViewController, button: UIButton) {
        return
    }
}

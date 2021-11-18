import UIKit
protocol ButtonActionDelegate {
    func runActionInPhase0(viewController: ViewController, button: UIButton)
    func runActionInPhase1(viewController: ViewController, button: UIButton)
    func runActionInPhase2(viewController: ViewController, button: UIButton)
    func runActionInPhase3(viewController: ViewController, button: UIButton)
    func runActionInPhase4(viewController: ViewController, button: UIButton)
}

extension ButtonActionDelegate {
    func runAction(viewController: ViewController, button: UIButton) {
        switch viewController.currentPhase {
        case .phase0:
            runActionInPhase0(viewController: viewController, button: button)
        case .phase1:
            runActionInPhase1(viewController: viewController, button: button)
        case .phase2:
            runActionInPhase2(viewController: viewController, button: button)
        case .phase3:
            runActionInPhase3(viewController: viewController, button: button)
        case .phase4:
            runActionInPhase4(viewController: viewController, button: button)
        }
    }
}

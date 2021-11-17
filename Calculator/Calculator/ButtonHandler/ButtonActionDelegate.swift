import UIKit
protocol ButtonActionDelegate: AnyObject {
    var viewController: ViewController? { get }
    func runAction(_ sender: UIButton)
}

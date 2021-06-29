import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayUserInputNumber: UILabel!
    
    private var isInUserInput: Bool = false
    private let input = Infix()
    private let postfix = Postfix()
    private let calculator = Calculator()
    
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        guard let unwrappedUserInputNumber = displayUserInputNumber.text else { return }
        guard let unwrappedcurrentTitle = sender.currentTitle else { return }
        if isInUserInput {
            let currentDisplay = unwrappedUserInputNumber
            displayUserInputNumber.text = currentDisplay + unwrappedcurrentTitle
        } else {
            displayUserInputNumber.text = unwrappedcurrentTitle
        }
        isInUserInput = true
    }
    
    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
        guard let unwrappedUserInputNumber = displayUserInputNumber.text else { return }
        guard let unwrappedcurrentTitle = sender.currentTitle else { return }
        input.infix.append(unwrappedUserInputNumber)
        input.infix.append(unwrappedcurrentTitle)
        isInUserInput = false
    }
    
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        guard let unwrappedUserInputNumber = displayUserInputNumber.text else { return }
        input.infix.append(unwrappedUserInputNumber)
        postfix.separateInfix(from: input.infix)

        do {
            let result = try calculator.returnCalculationResult(postfix: postfix.postfix)
            displayUserInputNumber.text = result
            print(input.infix)
            print(postfix.postfix)
            print(result)
        } catch {
            displayUserInputNumber.text = "NaN"
            print("NaN")
        }
    }
}

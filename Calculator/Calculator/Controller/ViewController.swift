import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayUserInputNumber: UILabel!
    
    private var userInput: Bool = false
    private let input = Infix()
    private let postfix = Postfix()
    private let calculator = Calculator()
    
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        if userInput {
            let currentDisplay = displayUserInputNumber.text!
            displayUserInputNumber.text = currentDisplay + sender.currentTitle!
        } else {
            displayUserInputNumber.text = sender.currentTitle!
        }
        userInput = true
    }
    
    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
        input.infix.append(displayUserInputNumber.text!)
        input.infix.append(sender.currentTitle!)
        userInput = false
    }
    
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        input.infix.append(displayUserInputNumber.text!)
        print(input.infix)
        postfix.separateInfix(from: input.infix)
        print(postfix.postfix)
    }
}

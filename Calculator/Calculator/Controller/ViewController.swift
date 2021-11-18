import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var UIScrollView: UIScrollView!
    
    var leftOperatorLabel: UILabel {
        let label = UILabel()
        return label
    }
    
    var rightOperandLabel: UILabel {
        let label = UILabel()
        return label
    }
    
    var stackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        UIScrollView.addSubview(stackView)
        stackView.addSubview(leftOperatorLabel)
        stackView.addSubview(rightOperandLabel)

        return stackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"

        
    }

    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {return}
        resultLabel.text?.append(contentsOf: operand)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {return}
        operatorLabel.text = `operator`
        rightOperandLabel.text = resultLabel.text
        resultLabel.text = ""
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        resultLabel.text = "0"
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        if resultLabel.text?.isEmpty == false {
            resultLabel.text?.removeLast()
        }
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
    }

    
}


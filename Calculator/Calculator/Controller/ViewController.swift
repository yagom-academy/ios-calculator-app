import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    func makeLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        return label
    }
    
    func makeStackView(with subviews: UIView...) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.alignment = .fill
        
        for i in subviews {
            stackView.addArrangedSubview(i)
        }
        
        return stackView
    }
    
    func makeSmallStackView() {
        let operandLabel = makeLabel(text: self.resultLabel.text)
        let operatorLabel = makeLabel(text: self.operatorLabel.text)
        let smallStackview = makeStackView(with: operatorLabel,operandLabel)
        
        stackView.addArrangedSubview(smallStackview)
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {return}
        resultLabel.text?.append(contentsOf: operand)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {return}
        operatorLabel.text = `operator`
        makeSmallStackView()
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


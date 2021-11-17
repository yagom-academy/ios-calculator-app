import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var UIScrollView: UIScrollView!
    
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
        resultLabel.text?.append(contentsOf: `operator`)
        operatorLabel.text = `operator`
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
        resultLabel.text = "0"
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
        if resultLabel.text?.isEmpty == false {
            resultLabel.text?.removeLast()
        }
    }
    
    @IBAction func plusMinusButtonChanged(_ sender: UIButton) {
        
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
    }
    
}


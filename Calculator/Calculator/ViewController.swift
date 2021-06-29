import UIKit

class ViewController: UIViewController {
    private var currentValue = "0"
    
    @IBOutlet weak var currentValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrentValueLabel()
    }
    
    private func updateCurrentValueLabel() {
        currentValueLabel.text = currentValue
    }
    
    @IBAction func acDidTap(_ sender: UIButton) {
    }
    @IBAction func ceDidTap(_ sender: UIButton) {
    }
    @IBAction func switchSignDidTap(_ sender: UIButton) {
    }
    @IBAction func divideDidTap(_ sender: UIButton) {
    }
    @IBAction func multiplyDidTap(_ sender: UIButton) {
    }
    @IBAction func minusDidTap(_ sender: UIButton) {
    }
    @IBAction func plusDidTap(_ sender: UIButton) {
    }
    @IBAction func equalDidTap(_ sender: UIButton) {
    }
    @IBAction func dotDidTap(_ sender: UIButton) {
    }
    
    @IBAction func numberDidTap(_ sender: UIButton) {
        guard let input = sender.titleLabel?.text else { return }
        
        if currentValue == "0" {
            guard input != "0" && input != "00" else { return }
                currentValue = input
        } else {
            currentValue = currentValue + input
        }
        updateCurrentValueLabel()
    }
}

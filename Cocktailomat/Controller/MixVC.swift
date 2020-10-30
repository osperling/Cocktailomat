import UIKit

class MixVC: UIViewController {
    
    @IBOutlet weak var drinkSlider1Value: UILabel!
    @IBOutlet weak var drinkSlider2Value: UILabel!
    @IBOutlet weak var drinkSlider3Value: UILabel!
    @IBOutlet weak var drinkSlider4Value: UILabel!
    
    @IBOutlet weak var containerLabel1: UIStackView!
    @IBOutlet weak var containerLabel2: UILabel!
    @IBOutlet weak var containerLabel3: UILabel!
    @IBOutlet weak var containerLabel4: UILabel!
    
    @IBOutlet weak var drinkSlider1: UISlider!
    @IBOutlet weak var drinkSlider2: UISlider!
    @IBOutlet weak var drinkSlider3: UISlider!
    @IBOutlet weak var drinkSlider4: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Getränk zusammenstellen"
        updateUI()
    }
    
    @IBAction func drinkSlider1ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        drinkSlider1Value.text = "\(x)%"
    }
    
    @IBAction func drinkSlider2ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        drinkSlider2Value.text = "\(x)%"
    }
    
    @IBAction func drinkSlider3ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        drinkSlider3Value.text = "\(x)%"
    }
    
    @IBAction func drinkSlider4ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        drinkSlider4Value.text = "\(x)%"
    }
    
    func updateUI(){
        drinkSlider1.maximumValue = 250
        drinkSlider2.maximumValue = 250
        drinkSlider3.maximumValue = 250
        drinkSlider4.maximumValue = 250
    }
}

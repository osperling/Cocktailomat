import UIKit

class DrinkVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Zuordnung Getränke"
        
        textField1.layer.borderColor = UIColor.lightGray.cgColor
        textField2.layer.borderColor = UIColor.lightGray.cgColor
        textField3.layer.borderColor = UIColor.lightGray.cgColor
        textField4.layer.borderColor = UIColor.lightGray.cgColor
        
        textField1.layer.borderWidth = 1.0
        textField2.layer.borderWidth = 1.0
        textField3.layer.borderWidth = 1.0
        textField4.layer.borderWidth = 1.0
        
        textField1.layer.cornerRadius = 5.0
        textField2.layer.cornerRadius = 5.0
        textField3.layer.cornerRadius = 5.0
        textField4.layer.cornerRadius = 5.0
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
    
}


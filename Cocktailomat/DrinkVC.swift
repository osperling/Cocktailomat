import UIKit

class DrinkVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    var cb: Cocktailbrain = Cocktailbrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Zuordnung Getränke"
        updateUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        //Werte die in das Cocktailbrain übergeben werden
        let text = [textField1.text!,textField2.text!,textField3.text!,textField4.text!]
        cb.behaelter = text
        if(textField1.text == "" && textField2.text == "" && textField3.text == "" && textField4.text == ""){
            textField1.flash()
            textField2.flash()
            textField3.flash()
            textField4.flash()
        }else{
            performSegue(withIdentifier: "goGlassVC", sender: self)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func updateUI(){
        let placeholder = NSAttributedString(string: "Getränk eingeben...",attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        textField1.tintColor = UIColor.black
        textField2.tintColor = UIColor.black
        textField3.tintColor = UIColor.black
        textField4.tintColor = UIColor.black
        
        textField1.attributedPlaceholder = placeholder
        textField2.attributedPlaceholder = placeholder
        textField3.attributedPlaceholder = placeholder
        textField4.attributedPlaceholder = placeholder

        textField1.setIcon(UIImage(named: "icon_cocktail")!)
        textField2.setIcon(UIImage(named: "icon_cocktail")!)
        textField3.setIcon(UIImage(named: "icon_cocktail")!)
        textField4.setIcon(UIImage(named: "icon_cocktail")!)

        textField1.layer.borderColor = UIColor.black.cgColor
        textField2.layer.borderColor = UIColor.black.cgColor
        textField3.layer.borderColor = UIColor.black.cgColor
        textField4.layer.borderColor = UIColor.black.cgColor
        
        textField1.layer.borderWidth = 1.0
        textField2.layer.borderWidth = 1.0
        textField3.layer.borderWidth = 1.0
        textField4.layer.borderWidth = 1.0
        
        textField1.layer.cornerRadius = 5.0
        textField2.layer.cornerRadius = 5.0
        textField3.layer.cornerRadius = 5.0
        textField4.layer.cornerRadius = 5.0
        
        textField1.backgroundColor = UIColor.white
        textField2.backgroundColor = UIColor.white
        textField3.backgroundColor = UIColor.white
        textField4.backgroundColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goGlassVC" {
            let destinationVC = segue.destination as! GlassVC
            destinationVC.cb = self.cb
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.3
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
}




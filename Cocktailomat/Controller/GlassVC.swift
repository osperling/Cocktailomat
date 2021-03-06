import UIKit

class GlassVC: UIViewController {

    @IBOutlet weak var shotButton: UIButton!
    @IBOutlet weak var smallCocktailButton: UIButton!
    @IBOutlet weak var bigCocktailButton: UIButton!
    @IBOutlet weak var shakerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var shotLabel: UILabel!
    @IBOutlet weak var smallCocktailLabel: UILabel!
    @IBOutlet weak var bigCocktailLabel: UILabel!
    @IBOutlet weak var shakerLabel: UILabel!
    
    @IBOutlet weak var shotButtonView: UIStackView!
    @IBOutlet weak var smallCocktailView: UIStackView!
    @IBOutlet weak var bigCocktailView: UIStackView!
    @IBOutlet weak var shakerView: UIStackView!
    
    var shot: Bool = false
    var smallCocktail: Bool = false
    var bigCocktail: Bool = false
    var shaker: Bool = false
    
    var cb: Cocktailbrain = Cocktailbrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Größe auswählen"
        updateUI()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let size = [shot,smallCocktail,bigCocktail,shaker]
        let ml = [20,100,230,400]
        
        for i in 0..<size.count {
            if size[i] == true {
                cb.glas = ml[i]
            }
        }
        
        if(shot == true || smallCocktail == true || bigCocktail == true || shaker == true){
            self.performSegue(withIdentifier: "goMixVC", sender: self)
        }else{
            shotButton.flash()
            smallCocktailButton.flash()
            bigCocktailButton.flash()
            shakerButton.flash()
        }
    }
    
    @IBAction func shotButtonPressed(_ sender: UIButton) {
        switchGlass("shot")
    }
    
    @IBAction func smallCocktailButtonPressed(_ sender: UIButton) {
        switchGlass("smallCocktail")
    }
    
    @IBAction func bigCocktailButtonPressed(_ sender: UIButton) {
        switchGlass("bigCocktail")
    }
    
    @IBAction func shakerButtonPressed(_ sender: UIButton) {
        switchGlass("shaker")
    }
    
    func switchGlass(_ size: String){
        shot = false
        shotLabel.layer.borderWidth = 0

        smallCocktail = false
        smallCocktailLabel.layer.borderWidth = 0

        bigCocktail = false
        bigCocktailLabel.layer.borderWidth = 0

        shaker = false
        shakerLabel.layer.borderWidth = 0

        switch size {
            case "shot":
                shot = true
                shotLabel.layer.borderWidth = 2
            case "smallCocktail":
                smallCocktail = true
                smallCocktailLabel.layer.borderWidth = 2
            case "bigCocktail":
                bigCocktail = true
                bigCocktailLabel.layer.borderWidth = 2
            case "shaker":
                shaker = true
                shakerLabel.layer.borderWidth = 2
            default:
                break
        }
    }
    
    func updateUI(){
        shotLabel.layer.borderColor = UIColor.white.cgColor
        shotLabel.layer.cornerRadius = 5
        
        smallCocktailLabel.layer.borderColor = UIColor.white.cgColor
        smallCocktailLabel.layer.cornerRadius = 5
        
        bigCocktailLabel.layer.borderColor = UIColor.white.cgColor
        bigCocktailLabel.layer.cornerRadius = 5
        
        shakerLabel.layer.borderColor = UIColor.white.cgColor
        shakerLabel.layer.cornerRadius = 5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goMixVC") {
            let destinationVC = segue.destination as! MixVC
            destinationVC.cb = self.cb
        }
    }
}

extension UIButton {
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 1
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}


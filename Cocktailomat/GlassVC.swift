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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Größe auswählen"
        
        shotLabel.layer.borderColor = UIColor.blue.cgColor
        shotLabel.layer.cornerRadius = 5
        
        smallCocktailLabel.layer.borderColor = UIColor.blue.cgColor
        smallCocktailLabel.layer.cornerRadius = 5
        
        bigCocktailLabel.layer.borderColor = UIColor.blue.cgColor
        bigCocktailLabel.layer.cornerRadius = 5
        
        shakerLabel.layer.borderColor = UIColor.blue.cgColor
        shakerLabel.layer.cornerRadius = 5
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func shotButtonPressed(_ sender: UIButton) {
        switchGlass((sender.titleLabel != nil))
        ausgabe()
    }
    
    @IBAction func smallCocktailButtonPressed(_ sender: UIButton) {
        switchGlass((sender.titleLabel != nil))
        ausgabe()
    }
    
    @IBAction func bigCocktailButtonPressed(_ sender: UIButton) {
        switchGlass((sender.titleLabel != nil))
        print(sender)
        ausgabe()
    }
    
    @IBAction func shakerButtonPressed(_ sender: UIButton) {
        switchGlass((sender.titleLabel != nil))
        ausgabe()
    }
    
    func switchGlass(_ size: Bool){
        print(size)
        shot = false
        shotLabel.layer.borderWidth = 0

        smallCocktail = false
        smallCocktailLabel.layer.borderWidth = 0

        bigCocktail = false
        bigCocktailLabel.layer.borderWidth = 0

        shaker = false
        shakerLabel.layer.borderWidth = 0

        switch size {
            case shot:
                shot = true
                shotLabel.layer.borderWidth = 3.0
            case smallCocktail:
                smallCocktail = true
                smallCocktailLabel.layer.borderWidth = 3.0
            case bigCocktail:
                bigCocktail = true
                bigCocktailLabel.layer.borderWidth = 3.0
            case shaker:
                shaker = true
                shakerLabel.layer.borderWidth = 3.0
            default:
                break
        }
    }
    
    func ausgabe(){
        print("shot = \(shot)")
        print("smallCocktail = \(smallCocktail)")
        print("bigCocktail = \(bigCocktail)")
        print("shaker = \(shaker)")
        print()
    }
}


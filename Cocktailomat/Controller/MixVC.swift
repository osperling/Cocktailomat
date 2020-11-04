import UIKit

class MixVC: UIViewController {
    
    @IBOutlet weak var drinkSlider1Value: UILabel!
    @IBOutlet weak var drinkSlider2Value: UILabel!
    @IBOutlet weak var drinkSlider3Value: UILabel!
    @IBOutlet weak var drinkSlider4Value: UILabel!
    
   
    
    @IBOutlet weak var drinkSlider1: UISlider!
    @IBOutlet weak var drinkSlider2: UISlider!
    @IBOutlet weak var drinkSlider3: UISlider!
    @IBOutlet weak var drinkSlider4: UISlider!
    
    @IBOutlet weak var getraenk1: UILabel!
    @IBOutlet weak var getraenk2: UILabel!
    @IBOutlet weak var getraenk3: UILabel!
    @IBOutlet weak var getraenk4: UILabel!
    
    
    
//    Noch die richtigen Startwerte anlegen
    var values = [0,0,0,0]
    var cb: Cocktailbrain = Cocktailbrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Getränk zusammenstellen"
        updateUI()
        print(cb.behaelter[0])
        getraenk1.text = cb.behaelter[0]
        getraenk2.text = cb.behaelter[1]
        getraenk3.text = cb.behaelter[2]
        getraenk4.text = cb.behaelter[3]
    }
    
    @IBAction func drinkSlider1ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        if (sum(valueOld: values[0],valueNew: x)) {
            drinkSlider1Value.text = "\(x)%"
            values[0] = x
        }else{
            sender.value = Float(values[0])
        }
        
    }
    
    @IBAction func drinkSlider2ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        if (sum(valueOld: values[1],valueNew: x)) {
            drinkSlider2Value.text = "\(x)%"
            values[1] = x
        }else{
            sender.value = Float(values[1])
        }
        
    }
    
    @IBAction func drinkSlider3ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        if (sum(valueOld: values[2],valueNew: x)) {
            drinkSlider3Value.text = "\(x)%"
            values[2] = x
        }else{
            sender.value = Float(values[2])
        }
        

    }
    
    @IBAction func drinkSlider4ValueChanged(_ sender: UISlider) {
        let x = Int(round(sender.value/5)*5)
        if(sum(valueOld: values[3],valueNew: x)){
            values[3] = x
            drinkSlider4Value.text = "\(x)%"
        }else{
            sender.value = Float(values[3])
        }
        

    }
    
    func updateUI(){
        drinkSlider1.maximumValue = 100
        drinkSlider2.maximumValue = 100
        drinkSlider3.maximumValue = 100
        drinkSlider4.maximumValue = 100

    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(values)
        cb.fuellung = self.values
        var ergebnis = cb.makeCocktail()
        print(cb.fuellungInML)
        print(cb.behaelter)
    }
    
    func sum(valueOld: Int, valueNew: Int) -> Bool {
        var sum = values[0]+values[1]+values[2]+values[3]
        if sum <= 100 {
            if(sum-valueOld+valueNew <= 100){
                return true
            }
            return false
        }
        return false
    }
    
}

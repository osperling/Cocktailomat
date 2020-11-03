import UIKit

class WifiVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    var cb = Cocktailbrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WLAN auswählen"
        cb.connection = true
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDrinkVC" {
            let destinationVC = segue.destination as! DrinkVC
            destinationVC.cb = self.cb
        }
    }
}


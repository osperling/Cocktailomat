import UIKit

class WifiVC: UIViewController {

    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var cb = Cocktailbrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WLAN auswählen"
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if(cb.establishConnection()){
            self.performSegue(withIdentifier: "goDrinkVC", sender: self)
        }else{
            wifiLabel.text = "Verbindung konnte nicht überprüft werden.\n\nBitte erneut versuchen."
        }
    }
}

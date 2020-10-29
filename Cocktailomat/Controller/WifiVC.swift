import UIKit

class WifiVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WLAN auswählen"
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
}


import UIKit

class LedVC: UIViewController {

    @IBOutlet weak var led_on: UIButton!
    @IBOutlet weak var led_off: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LED Control"
    }

    @IBAction func ledOnPressed(_ sender: UIButton) {
        urlRequest(URL(string: "http://192.168.4.1/led_on")!)
    }
    
    @IBAction func ledOffPressed(_ sender: UIButton) {
        urlRequest(URL(string: "http://192.168.4.1/led_off")!)
    }
    
    func urlRequest(_ url: URL){
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print("The response is : ",String(data: data, encoding: .utf8)!)
            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)
    }
        task.resume()
    }
}


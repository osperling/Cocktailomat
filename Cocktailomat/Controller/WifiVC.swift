import UIKit
import NetworkExtension
import CoreLocation
import Foundation
import SystemConfiguration.CaptiveNetwork

class WifiVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var cb = Cocktailbrain()
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WLAN auswählen"
        cb.connection = true
        
        wifiLabel.text = getWiFiSsid()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDrinkVC" {
            let destinationVC = segue.destination as! DrinkVC
            destinationVC.cb = self.cb
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            if #available(iOS 14.0, *) {
                NEHotspotNetwork.fetchCurrent { hotspotNetwork in
                    if let ssid = hotspotNetwork?.ssid {
                        print(ssid)
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    func getWiFiSsid() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        return ssid
    }
}

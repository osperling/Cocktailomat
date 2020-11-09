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
    
    @IBOutlet weak var behaelterView1: UIStackView!
    @IBOutlet weak var behaelterView2: UIStackView!
    @IBOutlet weak var behaelterView3: UIStackView!
    @IBOutlet weak var behaelterView4: UIStackView!
    
    @IBOutlet weak var tfOne: UITextField!
    @IBOutlet weak var tfTwo: UITextField!
    @IBOutlet weak var tfThree: UITextField!
    @IBOutlet weak var tfFour: UITextField!
    
    let myPickerData = [String](arrayLiteral: "1","2","3","4")
    var data = "0"
    var pos = [1,1,1,1]
    
//    Noch die richtigen Startwerte anlegen
    var values = [0,0,0,0]
    var cb: Cocktailbrain = Cocktailbrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Getränk zusammenstellen"
        tfOne.text = String(pos[0])
        tfTwo.text = String(pos[1])
        tfThree.text = String(pos[2])
        tfFour.text = String(pos[3])
        
        print(cb.behaelter[0])
        
        getraenk1.text = cb.behaelter[0]
        getraenk2.text = cb.behaelter[1]
        getraenk3.text = cb.behaelter[2]
        getraenk4.text = cb.behaelter[3]
        
        createPickerView()
        dismissPickerView()
        updateUI()
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
            drinkSlider4Value.text = "\(x)%"
            values[3] = x
        }else{
            sender.value = Float(values[3])
        }
    }
    
    func updateUI(){
        drinkSlider1.maximumValue = 100
        drinkSlider2.maximumValue = 100
        drinkSlider3.maximumValue = 100
        drinkSlider4.maximumValue = 100
        
        if(getraenk1.text!.isEmpty){
            behaelterView1.isHidden = true
        }
        
        if(getraenk2.text!.isEmpty){
            behaelterView2.isHidden = true
        }
        
        if(getraenk3.text!.isEmpty){
            behaelterView3.isHidden = true
        }
        
        if(getraenk4.text!.isEmpty){
            behaelterView4.isHidden = true
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(values)
        cb.fuellung = self.values
        pos[0] = Int(tfOne.text!)!
        pos[1] = Int(tfTwo.text!)!
        pos[2] = Int(tfThree.text!)!
        pos[3] = Int(tfFour.text!)!
        cb.pos = self.pos
        cb.makeCocktail()
        print(cb.fuellungInML)
        print(cb.behaelter)
    }
    
    func sum(valueOld: Int, valueNew: Int) -> Bool {
        let sum = values[0] + values[1] + values[2] + values[3]
        if sum <= 100 {
            if(sum - valueOld + valueNew <= 100){
                return true
            }
            return false
        }
        return false
    }
    
    func createPickerView() {
        let thePicker1 = UIPickerView()
        let thePicker2 = UIPickerView()
        let thePicker3 = UIPickerView()
        let thePicker4 = UIPickerView()
        tfOne.inputView = thePicker1
        tfTwo.inputView = thePicker2
        tfThree.inputView = thePicker3
        tfFour.inputView = thePicker4
        thePicker1.delegate = self
        thePicker2.delegate = self
        thePicker3.delegate = self
        thePicker4.delegate = self
        thePicker1.tag=1
        thePicker2.tag=2
        thePicker3.tag=3
        thePicker4.tag=4
    }
    
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
       let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
       tfOne.inputAccessoryView = toolBar
       tfTwo.inputAccessoryView = toolBar
       tfThree.inputAccessoryView = toolBar
       tfFour.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
}

extension MixVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count // number of dropdown items
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row] // dropdown item
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data = myPickerData[row] // selected item
        switch pickerView.tag {
        case 1:
            tfOne.text=data
        case 2:
            tfTwo.text = data
        case 3:
            tfThree.text = data
        case 4:
            tfFour.text = data
        default:
            print("Error")
        }
    }
}

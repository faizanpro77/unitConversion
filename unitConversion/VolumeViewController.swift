//
//  VolumeViewController.swift
//  unitConversion
//
//  Created by Yashom on 08/03/22.
//

import UIKit

class VolumeViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    let array1 = ["Litres", "Millilitres", "Gallon"]
    let array2 = ["Litres", "Millilitres", "Gallon"]
    
    @IBOutlet weak var textfeildInput: UITextField!
    @IBOutlet weak var outputLabelField: UILabel!
    @IBOutlet weak var pickerOne: UIPickerView!
    
 
    var firstPick:String?
    var secPick:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        pickerOne.dataSource = self
        pickerOne.delegate = self
        textfeildInput.delegate = self
        
        outputLabelField.layer.borderWidth = 1
        outputLabelField.layer.borderColor = UIColor.lightGray.cgColor
        
        
        outputLabelField.text = "--"
        
//        outputLabelField.textColor = .green
//        outputLabelField.backgroundColor = .lightGray
//        textfeildInput.backgroundColor = .yellow
//        textfeildInput.textColor = .red
        
         firstPick = array1[pickerOne.selectedRow(inComponent: 0)]
         secPick = array2[pickerOne.selectedRow(inComponent: 1)]

        
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(" shouldChangeCharactersIn ")
        let allowedNumbers = CharacterSet.decimalDigits
        let digitSet = CharacterSet(charactersIn: string)
        
        
        
        return allowedNumbers.isSuperset(of: digitSet)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection-----")
        calculate(firstPick: firstPick!, secPick: secPick!)
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return array1.count
        }   else {
            return array2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return array1[row]
        } else {
            return array2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
       // let text = inputTextField.text ?? ""
        
               
        if component == 0 {
            firstPick = array1[row]
        } else {
            secPick = array2[row]
        }
        
        calculate(firstPick: firstPick!,secPick: secPick!)
        
            }
    
    func calculate(firstPick:String,secPick:String) {
        print("-------------")
        guard let text = textfeildInput.text,
              !text.isEmpty else {
                  return
              }
        print(textfeildInput.text)
        
        guard let value = Double(text) else {
            
            return
        }
        
        
        print("+++++++++")
        if firstPick == "Litres" && secPick == "Litres" {
            let result = value
            outputLabelField.text = (" \(result) lt")
        } else if firstPick == "Litres" && secPick == "Millilitres" {
            let result = value * 1000
            outputLabelField.text = (" \(String(format: "%.4f", result)) ml")
        } else if firstPick == "Litres" && secPick == "Gallon" {
            let result = value / 4.546
            outputLabelField.text = (" \(String(format: "%.4f", result)) gl")
        } else if firstPick == "Millilitres" && secPick == "Millilitres" {
            let result = value
            outputLabelField.text = (" \(String(format: "%.4f", result)) ml")
        } else if firstPick == "Millilitres" && secPick == "Litres" {
            let result = value / 1000
            outputLabelField.text = (" \(result) ft")

        } else if firstPick == "Millilitres" && secPick == "Gallon" {
            let result = value / 4546
            outputLabelField.text = (" \(String(format: "%.4f", result)) gl")

        } else if firstPick == "Gallon" && secPick == "Gallon" {
            let result = value
            outputLabelField.text = ("\(String(format: "%.2f", result)) gl")
        } else if firstPick == "Gallon" && secPick == "Litres" {
            let result = value * 4.546
            outputLabelField.text = (" \(String(format: "%.4f", result)) lt")

        } else if firstPick == "Gallon" && secPick == "Millilitres" {
            let result = value * 4546
            outputLabelField.text = (" \(String(result)) ml")
        }

    }
    
    
}

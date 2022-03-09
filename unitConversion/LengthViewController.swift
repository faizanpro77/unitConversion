//
//  ViewController.swift
//  unitConversion
//
//  Created by Yashom on 07/03/22.
//

import UIKit

class LengthViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    let array1 = ["inch", "feet", "yard"]
    let array2 = ["inch", "feet", "yard"]
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabelField: UILabel!
    @IBOutlet weak var pickerOne: UIPickerView!
    
    
    //    @IBOutlet weak var inputTextField: UITextField!
//    @IBOutlet weak var outputLabelField: UILabel!
//    @IBOutlet weak var pickerOne: UIPickerView!

    var firstPick:String?
    var secPick:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        pickerOne.dataSource = self
        pickerOne.delegate = self
        inputTextField.delegate = self
        
        outputLabelField.layer.borderWidth = 1
        outputLabelField.layer.borderColor = UIColor.lightGray.cgColor
        
        
        outputLabelField.text = "--"
        
        
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
        guard let text = inputTextField.text,
              !text.isEmpty else {
                  return
              }
        print(inputTextField.text)
        
        guard let value = Double(text) else {
            
            return
        }
        
        print("+++++++++")
        if firstPick == "inch" && secPick == "inch" {
            let result = value
            outputLabelField.text = (" \(result) in")
        } else if firstPick == "inch" && secPick == "feet" {
            let result = value * 12
            outputLabelField.text = (" \(String(format: "%.4f", result)) ft")
        } else if firstPick == "inch" && secPick == "yard" {
            let result = value / 36
            outputLabelField.text = (" \(String(format: "%.4f", result)) yd")
        } else if firstPick == "feet" && secPick == "inch" {
            let result = value * 12
            outputLabelField.text = (" \(String(format: "%.4f", result)) in")
        } else if firstPick == "feet" && secPick == "feet" {
            let result = value
            outputLabelField.text = (" \(result) ft")

        } else if firstPick == "feet" && secPick == "yard" {
            let result = value / 3.0
            outputLabelField.text = (" \(String(format: "%.4f", result)) yd")

        } else if firstPick == "yard" && secPick == "inch" {
            let result = value * 36
            outputLabelField.text = ("\(String(format: "%.2f", result)) in")
        } else if firstPick == "yard" && secPick == "feet" {
            let result = value * 3
            outputLabelField.text = (" \(String(format: "%.4f", result)) ft")

        } else if firstPick == "yard" && secPick == "yard" {
            let result = value
            outputLabelField.text = (" \(String(result)) yd")
        }

    }
    
    
}

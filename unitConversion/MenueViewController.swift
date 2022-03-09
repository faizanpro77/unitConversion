//
//  MenueViewController.swift
//  unitConversion
//
//  Created by Yashom on 08/03/22.
//

import UIKit

class MenueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLenght(_ sender: Any) {
        let Length = self.storyboard?.instantiateViewController(withIdentifier: "LengthViewController") as! LengthViewController
        self.navigationController?.pushViewController(Length, animated: true)
    }
    
    @IBAction func btnVolume(_ sender: UIButton) {
        let Volume = self.storyboard?.instantiateViewController(withIdentifier: "VolumeViewController") as! VolumeViewController
        self.navigationController?.pushViewController(Volume, animated: true)
    }
    
    @IBAction func btnTemprature(_ sender: UIButton) {
        
        let Temprature = self.storyboard?.instantiateViewController(withIdentifier: "TempratureViewController") as! TempratureViewController
        self.navigationController?.pushViewController(Temprature, animated: true)
    }
}

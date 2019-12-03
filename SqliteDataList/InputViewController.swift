//
//  InputViewController.swift
//  SqliteDataList
//
//  Created by Emre Türker on 3.12.2019.
//  Copyright © 2019 MasamMahmood. All rights reserved.
//

import UIKit

protocol InputDelegate {
    func listFunc(listValue: String)
}

class InputViewController: UIViewController {

    @IBOutlet weak var inputTxt: UITextField!
    @IBOutlet weak var passBtn: UIButton!
    var Inputdelegate: InputDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func inputBtn(_ sender: Any) {
        let value = inputTxt.text
        Inputdelegate?.listFunc(listValue: value ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    
   

}

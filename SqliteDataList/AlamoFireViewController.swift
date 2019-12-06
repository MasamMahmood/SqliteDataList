//
//  AlamoFireViewController.swift
//  SqliteDataList
//
//  Created by Emre Türker on 4.12.2019.
//  Copyright © 2019 MasamMahmood. All rights reserved.
//

import UIKit
import Alamofire

class AlamoFireViewController: UIViewController {
    
    var AppData = [DataClass]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let url = Bundle.main.url(forResource: "file", withExtension: "json") {
            do {
                
                let data = try Data(contentsOf: url)
                 let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Array<DataClass>.self, from: data)
                self.AppData = jsonData
                //print (jsonData.first?.locationName ?? "")
                
                for a in AppData{
                    print(a.locationName ?? "")
                }
                
            } catch {
                print("error:\(error)")
            }
        }
    }
    

   

}

//
//  ViewController.swift
//  SqliteDataList
//

//

import UIKit
import Alamofire
import SQLite


class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var AppData : SectionList?
    var db: Connection?
    var FinalData : [String]?
    var IndexData = [SectionList]()
    
   
    let tblPicklist = Table("PickList")
    let firmID = Expression<Int>("firmID")
    let version = Expression<Int>("version")
    let actionType = Expression<Int>("actionType")
    let titleValue = Expression<String>("title")
    let textField = Expression<String>("textField")
    
    struct SectionList {
        let letter : String
        let names : [String]
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        dbSetup()
        dbSelectOperation()
       
    }
    
    func dbSetup()
    {
        let databaseFileName = "db.sqlite3"
        let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(databaseFileName)"
        db = try! Connection(databaseFilePath)

        
        try! db!.run(tblPicklist.create(ifNotExists: true) { t in
            t.column(firmID)
            t.column(version)
            t.column(actionType)
            t.column(titleValue)
            t.column(textField)
            
            
        })
    }
    
    
    func dbSelectOperation() -> Int
    {
        
        var count = 0
        do{
            FinalData = [String]()
            let user = self.tblPicklist.filter(actionType==1001).order(textField)
            for list in try db!.prepare(user) {
            //print("FirmId: \(list[firmID]), Version: \(list[version]), ActionType: \(list[actionType]), Title: \(list[titleValue]), Value: \(list[textField])")
            
                FinalData?.append(list[textField] as String)
                             
            }
            let groupedDictionary = Dictionary(grouping: FinalData!, by: {String($0.prefix(1))})
            // get the keys and sort them
            let keys = groupedDictionary.keys.sorted()
            // map the sorted keys to a struct
            IndexData = keys.map{ SectionList(letter: $0, names: groupedDictionary[$0]!.sorted()) }
            self.tableView.reloadData()
        }
        catch {
            print ("selection error: \(error)")
        }
    return count
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return IndexData[section].letter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IndexData[section].names.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return IndexData.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return IndexData.map{$0.letter}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let section = IndexData[indexPath.section]
        let dic = section.names[indexPath.row]
        cell.textLabel?.text = dic
        return cell
    }
    
    //MARK: - Selection tableView
       
       func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
           if let cell = tableView.cellForRow(at: indexPath) {
               cell.accessoryType = .none
                           
           }
       }
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//           if let cell = tableView.cellForRow(at: indexPath) {
//               cell.accessoryType = .checkmark
//               let selectedRows = tableView.indexPathsForSelectedRows
//                print(selectedRows)
//
//
//
//           }
        if let index = IndexData. {
          let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
          cell?.accessoryType = .none
        }
        
       }
      
        
}

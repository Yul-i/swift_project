//
//  TableViewController.swift
//  ikmyeong
//
//  Created by apple on 2021/11/18.
//

import UIKit
import SQLite3

//var items = ["익명이1", "익명이2", "익명이3"]
var itemImageFile = "stand.png"

var ikName : [String] = []
var ikDesc : [String] = []

class TableViewController: UITableViewController {
    @IBOutlet var tableList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        ikName = []
        ikDesc = []
        
        let db = SQLite3DB2()
        db.query()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ikName.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = ikName[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemImageFile)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            ikName.remove(at: (indexPath as NSIndexPath).row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//
//            let db = SQLite3DB2()
//            let no = ikName[(indexPath as NSIndexPath).row]
//            db.delete(name:no)
//
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        return "지우기"
//    }



    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = ikName[(fromIndexPath as NSIndexPath).row]
        ikName.remove(at: (fromIndexPath as NSIndexPath).row)
        ikName.insert(itemToMove, at: (to as NSIndexPath).row)
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgDetail" {
               let cell = sender as! UITableViewCell
               let indexPath = self.tableList.indexPath(for: cell)
               let detailView = segue.destination as! DetailViewController
               detailView.receiveItem(ikName[((indexPath! as NSIndexPath).row)], ikDesc[((indexPath! as NSIndexPath).row)])
           }
        
    }


}


class SQLite3DB2{

    let path:String = {
    let fm = FileManager.default

    return fm.urls(for: .libraryDirectory, in: .userDomainMask).last!
    .appendingPathComponent("anonymous.db").path
        
    }()
    
    //db연결하는 함수
      func openDatabase() -> OpaquePointer? {
          var con : OpaquePointer? = nil
          if (sqlite3_open(path, &con) == SQLITE_OK) {
              print("연결 성공")
          }else{
              print("연결 실패")
          }
          return con
      }
      
    //select하는 함수
        let sql_query = "select * from ikmyeong;"
        func query(){
            let db = openDatabase()
            var con : OpaquePointer? = nil
            //sql문 객체화, 실행
            if sqlite3_prepare_v2(db, sql_query, -1, &con, nil) == SQLITE_OK {
                print("sql문 객체화 성공")
                while sqlite3_step(con) == SQLITE_ROW{
                    print("회원 검색 성공.")
                    let name = sqlite3_column_text(con, 0)
                    let desc = sqlite3_column_text(con, 1)
                    let n = String(cString: name!)
                    let d = String(cString: desc!)
                    
                    ikName.append(n)
                    ikDesc.append(d)
                }
          }else{
              print("sql문 객체화 실패")
          }
          
       
            
          sqlite3_finalize(con)
            
        }
    
}

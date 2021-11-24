//
//  ViewController.swift
//  sqlite3Test
//
//  Created by Alicia Lim on 2021/11/05.
//

import UIKit
import SQLite3


class ViewController: UIViewController {
    var sqldb : SQLite3DB?
    @IBOutlet var nameText: UITextField!
    @IBOutlet var noText: UITextField!
    @IBOutlet var queryResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let sqldb = SQLite3DB()
        //sqldb.createTable()
        
//        sqldb.insert()
//        sqldb.query()
    }

    
    
    
    @IBAction func insertBtn(_ sender: UIButton) {
        sqldb = SQLite3DB()
        let no = Int32(noText.text!)!
        let name = NSString(utf8String: nameText.text!)!
        print("no: ", no , ", name: ", name)
        sqldb?.insert(id: no, name: name)
    }
    
    
    
    @IBAction func dbStartBtn(_ sender: UIButton) {
        //let sqldb = SQLite3DB()
        sqldb = SQLite3DB()
        print("1. db연결 생성 성공")
        sqldb?.createTable()
        print("2. 테이블 생성 성공")
    }
    
    
    
    
    @IBAction func queryBtn(_ sender: UIButton) {
        sqldb = SQLite3DB()
        sqldb?.query(&self.queryResult)
        print("1. 전체 검색 성공")
    }
    
}

class SQLite3DB {


    let path: String = {
          let fm = FileManager.default
//            print("fm", fm)
//            print(fm.urls(for:.libraryDirectory, in:.userDomainMask).last!
//                    .appendingPathComponent("ToDo3.db").path)
          return fm.urls(for:.libraryDirectory, in:.userDomainMask).last!
                   .appendingPathComponent("ToDo5.db").path
    }()

    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        if sqlite3_open(path, &db) == SQLITE_OK {
            print("-- 연결된 경로는 \(path)")
            return db
        } else {
            print("연결할 수 없음.")
            return db
        }
    }
     
//    let db = openDatabase()


    let createTableString = """
    CREATE TABLE Contact(
    Id INT PRIMARY KEY NOT NULL,
    Name CHAR(255));
    """
     
    func createTable() {
        let db = openDatabase()
        // 1
        var createTableStatement: OpaquePointer? = nil
        // 2
        if sqlite3_prepare_v2(db, createTableString, -1,
                              &createTableStatement, nil) == SQLITE_OK {
            // 3
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Contact table created.")
            } else {
                print("Contact table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        // 4
        sqlite3_finalize(createTableStatement)
    }
     


//    let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
     
//    func insert() {
//        let db = openDatabase()
//        var insertStatement: OpaquePointer? = nil
//        // 1
//        if sqlite3_prepare_v2(db,
//                              insertStatementString, -1,
//                              &insertStatement, nil) == SQLITE_OK {
//            let id: Int32 = 2
//            let name: NSString = "Song"
//
//            // 2
//            sqlite3_bind_int(insertStatement, 1, id)
//            // 3
//            sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)
//
//            // 4
//            if sqlite3_step(insertStatement) == SQLITE_DONE {
//                print("Successfully inserted row.")
//            } else {
//                print("Could not insert row.")
//            }
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        // 5
//        sqlite3_finalize(insertStatement)
//    }
    
    
    let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
    func insert(id : Int32, name: NSString) {
        let db = openDatabase()
        var insertStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db,
                              insertStatementString, -1,
                              &insertStatement, nil) == SQLITE_OK {
//            let id: Int32 = 2
//            let name: NSString = "Song"
            
            // 2
            sqlite3_bind_int(insertStatement, 1, id)
            // 3
            sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)
            
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
    }
    
    let queryStatementString = "SELECT * FROM Contact;"
     
    func query(_ label : inout UILabel) {
        let db = openDatabase()
        var queryStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // 2
            var result = ""
            while sqlite3_step(queryStatement) == SQLITE_ROW {
           // if sqlite3_step(queryStatement) == SQLITE_ROW {
                // 3
                let id = sqlite3_column_int(queryStatement, 0)
                
                // 4
                let queryResultCol1 = sqlite3_column_text(queryStatement, 1)
                let name = String(cString: queryResultCol1!)
                
                // 5
                //print("Query Result:")
                print("\(id) | \(name)")
                var row = "id: " + String(id) + ", name: " + name
                print("row>> " , row)
                result.append(row + "\n")
               
           // } else {
               // print("Query returned no results")
            //}
            }
            print("result>> " , result)
            label.text = result
        } else {
            print("SELECT statement could not be prepared")
        }
        // 6
        sqlite3_finalize(queryStatement)
    }
     


    
}


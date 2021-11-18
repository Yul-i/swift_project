//
//  makeViewController.swift
//  ikmyeong
//
//  Created by apple on 2021/11/18.
//

import UIKit
import SQLite3

class makeViewController: UIViewController {

    @IBOutlet var nameText: UITextField!
    @IBOutlet var descText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
       let db = SQLite3DB()
       let name = NSString(utf8String: nameText.text!)!
       let desc = NSString(utf8String: descText.text!)!
       print("name>>", name, " name: ", desc)
       db.insert(name: name, descript: desc)
    }
    
    
    @IBAction func btnMake(_ sender: UIButton) {
        var db = SQLite3DB()
        db.createTable()
    }
    

}

class SQLite3DB{

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
      
      //table만드는 함수
      let sql_create =
      """
      create table ikmyeong(
      name char(255) not null,
      descript char(255)
      );
      """
      func createTable() {
          let db = openDatabase()
          var con : OpaquePointer? = nil
          //sql문 객체화, 실행
          if sqlite3_prepare_v2(db, sql_create, -1, &con, nil) == SQLITE_OK {
              print("sql문 객체화 성공")
              if sqlite3_step(con) == SQLITE_DONE {
                  print("테이블 생성 성공")
              }else{
                  print("테이블 생성 실패")
              }
          }else{
              print("sql문 객체화 실패")
          }
          //실행이 성공하면 테이블이 생성되었습니다.
          sqlite3_finalize(con)
      }
      
    //insert하는 함수
        let sql_insert = "insert into ikmyeong values (?,?);"
        func insert(name: NSString, descript:NSString){
            let db = openDatabase()
            var con : OpaquePointer? = nil
            //sql문 객체화, 실행
            if sqlite3_prepare_v2(db, sql_insert, -1, &con, nil) == SQLITE_OK {
                
                sqlite3_bind_text(con, 1, name.utf8String, -1, nil)
                sqlite3_bind_text(con, 2, descript.utf8String, -1, nil)//-1 크기 자동으로 알아서 해
                
                print("sql문 객체화 성공")
                if sqlite3_step(con) == SQLITE_DONE {
                    print("회원 가입 성공")
                }else{
                    print("회원 가입 실패")
                }
            }else{
                print("sql문 객체화 실패")
            }
            //실행이 성공하면 테이블이 생성되었습니다.
            sqlite3_finalize(con)
        }
      

}




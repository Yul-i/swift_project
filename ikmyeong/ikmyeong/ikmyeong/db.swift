//
//  db.swift
//  ikmyeong
//
//  Created by apple on 2021/11/18.
//

import Foundation
import SQLite3

class db{
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
          let sql_insert = "insert into ikmyeong valus (?,?);"
          func insert(name: NSString, descript:NSString){
             // sqlite3_finalize(<#T##pStmt: OpaquePointer!##OpaquePointer!#>)
          }
          
        //select하는 함수
            let sql_query = "select * from ikmyeong;"
            func query(){
                let db = openDatabase()
                var con : OpaquePointer? = nil
                //sql문 객체화, 실행
                if sqlite3_prepare_v2(db, sql_query, -1, &con, nil) == SQLITE_OK {
                    print("sql문 객체화 성공")
                    var ikName : [String] = []
                    var ikDesc : [String] = []
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
        
        //delete하는 함수
            let sql_delete = "delete from ikmyeong where name = ?;"
            func delete(name: Int32){
                let db = openDatabase()
                var con : OpaquePointer? = nil
                //sql문 객체화, 실행
                if sqlite3_prepare_v2(db, sql_delete, -1, &con, nil) == SQLITE_OK {
                    
                    sqlite3_bind_int(con, 1, name)
                    
                    print("sql문 객체화 성공")
                    if sqlite3_step(con) == SQLITE_DONE {
                        print("회원 탈퇴 성공")
                    }else{
                        print("회원 탈퇴 실패")
                    }
                }else{
                    print("sql문 객체화 실패")
                }
                //실행이 성공하면 테이블이 삭제되었습니다.
                sqlite3_finalize(con)
            }
    }

}


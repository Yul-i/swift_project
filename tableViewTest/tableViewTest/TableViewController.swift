//
//  TableViewController.swift
//  tableViewTest
//
//  Created by Alicia Lim on 2021/11/07.
//

import UIKit

var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //왼쪽에 수정 버튼 나타남(-기호 버튼이 자동으로 생성됨!!-신기!!)
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    

    // MARK: - Table view data source
    //선택을 몇 개 할 것인가 지정
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //전체 개수 지정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

   //하나의 셀당 단위 정의
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        //items라는 배열의 각 인덱스에 있는 값을 가지고 와서
        //cell의 textLabel의 텍스트로 넣어라.
        //cell단위로 넣고 싶은 것을 생성해서 넣으면 됨.
        //지금은 textLabel과 imageView를 넣었음.
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        return cell
    }
    
    
    //다른 페이지로 갔다가 다시 호출되는 경우
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() //변경된 데이터를 읽어들인다.
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    

    
    // 목록 삭제하기나 추가하기 메뉴를 나타나게 하고, 그 이후 처리도 정의할 수 있음.
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            items.append("나는 뉴페이스")
            itemsImageFile.append("pencil.png")
        }
    }
    
    
    //빈 화면에서 tableview라고 타이핑하면 선택할 수 있는 메뉴 나타남.
    override func tableView(_ tableView: UITableView,
                            titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath)-> String? {
        return "삭제"
    }
    

    
    
    // 목록의 순서를 변경할 때
    override func tableView(_ tableView: UITableView,
                            moveRowAt fromIndexPath: IndexPath,
                            to: IndexPath) {
        //임시변수에 옮겨넣고
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        
        //원래 있던 자리에서 지우고
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        
        //옮기려고 하는 위치에 넣는다.
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    


     // 세그웨이를 통해 데이터를 보내고 싶을 때
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         if segue.identifier == "sgDetail" {
             let cell = sender as! UITableViewCell
             let indexPath = self.tvListView.indexPath(for: cell)
             let detailView = segue.destination as! DetailViewController
             detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
         }
     }

}

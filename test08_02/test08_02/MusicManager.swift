//
//  MusicManager.swift
//  test08_02
//
//  Created by apple on 2021/11/18.
//

import UIKit

class MusicManager: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let Sing : [String] = ["나로 바꾸자", "롤린", "라일락", "운전만 해", "라라라"]
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
              
        cell.textLabel?.text = Sing[indexPath.row]
              
              return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "PlayList", message: "노래 제목: "+Sing[indexPath.row], preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "확인", style: .default) {
                        action in
                              })
          self.present(alert, animated: true, completion: nil)

    }


}

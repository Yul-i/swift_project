//
//  ViewController.swift
//  test06
//
//  Created by apple on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var underLabel: UILabel!
    

    let inteval = 1.0
    let timeSelector : Selector = #selector(ViewController.updateTime)
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: inteval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.yellow
        let date = NSDate()
        print(date)
        var formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd HH:mm EEE"
        topLabel.text = "현재시각: " + formatter.string(from: date as Date)
    }


    @objc func updateTime(){
        //날짜, 시각 가지고와서
        //위의 라벨 현재시각부분에 text로 넣어줄 예정
        count = count + 1
       // topLabel.text = "현재시각: " + String(count)
        print("1초마다 내가 실행되어요...")
        //10초후에 배경을 빨강으로 변경하세요.!
        if count == 10 {
            view.backgroundColor = UIColor.red
        }
        //15초후에 경고창을 띄워보세요.!
        if count == 15{
            let alert = UIAlertController(title: "시간! 15초되었음.!", message: "집에 갑시다.!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
                print("15초 완료")
               
            })
            self.present(alert, animated: true, completion: nil)
        }
        //20초후에 넘어가봅시다. page1으로!
        if count == 20{
            guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page1") else {return}

               //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
            go.modalTransitionStyle = UIModalTransitionStyle.coverVertical
               
               //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
            self.present(go, animated: true)
            
        }

    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        print(datePickerView.date)
        //2021-11-17 08:09:00 +0000
        //underLabel.text = String(datePickerView.date)
        var formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd HH:mm EEE"
        underLabel.text = formatter.string(from: datePickerView.date)
    }
}


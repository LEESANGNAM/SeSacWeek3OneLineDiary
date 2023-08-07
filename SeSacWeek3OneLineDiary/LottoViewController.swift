//
//  LottoViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/08/03.
//

import UIKit
import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
  
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var bonuNumberLabel: UILabel!
    
    let pickerView = UIPickerView()
    
    var number: Int = 0
    
    var list: [Int] = Array(1...1100).reversed()
    //Array(repeating: 100, count: 1000)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("1")
        print("2")
        callRequest(number: 1079)
        
        print("4")
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        numberTextField.inputView = pickerView
        numberTextField.tintColor = .clear
        
        print("5")
    }
    
    func callRequest(number: Int){
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                print("3")
                
                let date = json["drwNoDate"].stringValue
                let bounsNumber = json["bnusNo"].intValue
                
                print("date",date,"bounsNumber",bounsNumber)
                
                self.dateLabel.text = date
                self.bonuNumberLabel.text = "\(bounsNumber)번"
                
            case .failure(let error):
                print(error)
            }
        }
    }
   
    
    
    //돌아가는거 몇개
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 셀 몇개
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    // 선택
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = "\(list[row])"
        number = list[row]
        
        callRequest(number: number)
    }
    //
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(list[row])"
    }
    
    
    
}

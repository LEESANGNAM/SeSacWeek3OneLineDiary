//
//  LottoViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/08/03.
//

import UIKit

class LottoViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
  
    @IBOutlet weak var numberTextField: UITextField!
    
    
    let pickerView = UIPickerView()
    
    
    var list: [Int] = Array(1...1100).reversed()
    //Array(repeating: 100, count: 1000)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        numberTextField.inputView = pickerView
        numberTextField.tintColor = .clear
        // Do any additional setup after loading the view.
    }
    
    //돌아가는거 몇개
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    // 셀 몇개
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    // 선택
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = "\(list[row])"
    }
    //
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(list[row])"
    }
    
    
    
}

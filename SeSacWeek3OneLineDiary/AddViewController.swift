//
//  ViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/07/31.
//

import UIKit

enum TransitionType: String{
    case add = "추가화면"
    case edit = "수정화면"
}



class AddViewController: UIViewController,UITextViewDelegate{
    
    @IBOutlet weak var mainTextView: UITextView!
    
    var type: TransitionType = .add
    var text: String = ""
    let placeholderText = "내용을 입력해주세요."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTextView.delegate = self

        // Do any additional setup after loading the view.
        setBackgroundColor()
        mainTextView.text = text
        title = type.rawValue
        switch type {
        case .add:
            
            mainTextView.text = placeholderText
            mainTextView.textColor = .lightGray
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(back) )
        case .edit: break
        }
        
        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        print(#function)
        print(textView.text.count)
        title = "\(textView.text.count)글자"
    }
    // 편집이 시작될 때,(커서가 시작될 때)
    //플레이스 홀더와 텍스트뷰 글자가 같다면 clear,color
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 편집이 끝날 때 (커서가 없어지는 순간)
    // 사용자가 아무 글자도 안 썼으면 플레이스 홀더 글자 보이게 설정!
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
        
    }
    
    
    
    
    
    @objc func back(){
        
        // present <-> dismiss
        dismiss(animated: true)
        // push <-> pop
//        navigationController?.popViewController(animated: true)
    }

}


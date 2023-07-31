//
//  ViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/07/31.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackgroundColor()
        title = "추가화면"
        
     
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(back) )
     
        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    
    @objc func back(){
        
        // present <-> dismiss
        dismiss(animated: true)
        // push <-> pop
//        navigationController?.popViewController(animated: true)
    }

}


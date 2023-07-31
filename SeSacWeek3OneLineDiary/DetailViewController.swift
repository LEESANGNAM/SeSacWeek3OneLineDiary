//
//  DetailViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        
        // push - pop (nav)
        navigationController?.popViewController(animated: true)
        
    }
    
}

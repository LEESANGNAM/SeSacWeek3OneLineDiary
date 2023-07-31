//
//  DetailViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    var labelString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = labelString
        setBackgroundColor()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        
        // push - pop (nav)
        navigationController?.popViewController(animated: true)
        
    }
    
}

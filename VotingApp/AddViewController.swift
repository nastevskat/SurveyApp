//
//  AddViewController.swift
//  VotingApp
//
//  Created by Tamara Nastevska on 12/20/22.
//  Copyright © 2022 Tamara Nastevska. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    
    @IBOutlet weak var addNewLabela: UILabel!
    @IBOutlet weak var voteStart: UIDatePicker!
    @IBOutlet weak var voteEnd: UIDatePicker!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var optionTextField: UITextField!
    @IBOutlet weak var addNewOptionBtn: UIButton!
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNewOptionPressed(_ sender: Any) {
          let textFieldFrame = CGRect(origin: CGPoint(x: 50, y: 100), size: CGSize(width: 200, height: 30))
              let textField = UITextField(frame: textFieldFrame)
              textField.placeholder = "Type name"
              
              view?.addSubview(textField)
    }
    


}

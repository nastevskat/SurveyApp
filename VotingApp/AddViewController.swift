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
    @IBOutlet weak var addNewOptionBtn: UIButton!
     
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private var fieldHeight = 203
    @IBAction private func addNewOptionPressed(_ sender: Any) {
          fieldHeight+=44
          let textFieldFrame = CGRect(origin: CGPoint(x: 20, y:fieldHeight), size: CGSize(width: 220, height: 34))
          let opcija = UITextField(frame: textFieldFrame)
          opcija.placeholder = " Enter option"
          opcija.borderStyle = UITextField.BorderStyle.roundedRect
          self.view.addSubview(opcija)
    }
    


}

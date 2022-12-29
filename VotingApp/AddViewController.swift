//
//  AddViewController.swift
//  VotingApp
//
//  Created by Tamara Nastevska on 12/20/22.
//  Copyright © 2022 Tamara Nastevska. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddViewController: UIViewController {
    
    @IBOutlet weak var addNewLabela: UILabel!
    @IBOutlet weak var voteStart: UIDatePicker!
    @IBOutlet weak var voteEnd: UIDatePicker!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var addNewOptionBtn: UIButton!
    var database =  Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private var fieldHeight = 203
    var broj = 0
    var opcii : [String] = []
    @IBAction private func addNewOptionPressed(_ sender: Any) {
          fieldHeight+=44
          let textFieldFrame = CGRect(origin: CGPoint(x: 20, y:fieldHeight), size: CGSize(width: 220, height: 34))
          let opcija = UITextField(frame: textFieldFrame)
          opcija.placeholder = " Enter option"
          opcija.borderStyle = UITextField.BorderStyle.roundedRect
          opcija.accessibilityIdentifier = "broj"
          broj+=1
          let opc = opcija.text!
          self.view.addSubview(opcija)
          opcii.append(opc)
        
    }
     
    @IBAction func addNewPollPressed(_ sender: Any) {
            let start = voteStart.date
            let end = voteEnd.date
            let question = questionTextField.text
            let options = opcii
         

        let poll : [String : Any] = [
                "start" : "",
                "end" : "" ,
                "question" : question! ,
                "options" : opcii  ]
    
            database.child("Poll").setValue(poll)
        }
        
    
    

}

//
//  SignUpViewController.swift
//  VotingApp
//
//  Created by Tamara Nastevska on 12/13/22.
//  Copyright © 2022 Tamara Nastevska. All rights reserved.
//

import UIKit
import FirebaseAuth


class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var isAdminSwitch: UISwitch!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var adminLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser {
            if user.displayName == "Admin"{
                self.performSegue(withIdentifier: "adminSegue" , sender: nil)
            }else {
                self.performSegue(withIdentifier: "userSegue", sender: nil)
            }
        }
    }
   
  
   
    
    @IBAction func registerBtn(_ sender: Any) {
        if email.text == "" || password.text == "" || phoneNo.text == nil {
            displayAlert(title: "Missing Information", message: "You must provide both, email and password!")
        } else {
            if let email = email.text {
            if let password = password.text{
                if let number = phoneNo.text {
                    print("")
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            self.displayAlert(title: "Error", message: error!.localizedDescription)
                        }
          else {
                                  print("Sign Up Success")
                                  if self.isAdminSwitch.isOn {
                                      //Admin
                                      let req = Auth.auth().currentUser?.createProfileChangeRequest();
                                      req?.displayName = "Admin"
                                      req?.commitChanges(completion: nil)
                                      self.performSegue(withIdentifier: "adminSegue", sender: nil)
                                  }
                                  else {
                                      //User
                                      let req = Auth.auth().currentUser?.createProfileChangeRequest();
                                      req?.displayName = "User"
                                      req?.commitChanges(completion: nil)
                                      self.performSegue(withIdentifier: "userSegue", sender: nil)
                            }
                        }
                    }
                }
            }
        }
    }
    }
        
    @IBAction func alreadyHaveAccBtn(_ sender: Any) {
       self.performSegue(withIdentifier: "loginSegue", sender: nil)
}
   func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}



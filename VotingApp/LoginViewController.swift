//
//  LoginViewController.swift
//  VotingApp
//
//  Created by Tamara Nastevska on 12/13/22.
//  Copyright © 2022 Tamara Nastevska. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     override func viewDidAppear(_ animated: Bool) {
//         if let user = Auth.auth().currentUser {
//             if user.displayName == "Admin"{
//                 self.performSegue(withIdentifier: "adminSegue" , sender: nil)
//             }else {
//                 self.performSegue(withIdentifier: "userSegue", sender: nil)
//             }
//         }
     }
    
    @IBAction func loginBtn(_ sender: Any) {
        if email.text == "" || password.text == "" {
                   displayAlert(title: "Missing Information", message: "You must provide both, email and password!")
        }else {    if let email = email.text {
                   if let password = password.text {     Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
        if error != nil {
            self.displayAlert(title: "Error", message: error!.localizedDescription)
        }
        else {
            print("Log In Success")
            if user?.user.displayName == "Admin" {
                print("Admin")
                self.performSegue(withIdentifier: "adminSegue", sender: nil)
            }
            else {
                print("User")
                self.performSegue(withIdentifier: "userSegue", sender: nil)
                            }
                        }
                    }
                }
            }
        }
    }
  
    @IBAction func createAccBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
    }
   
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}

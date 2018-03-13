//  ImageViewController.swift
//  Beauty Blend
//  Created by Amy Wichelow on 08/11/2017.
//  Copyright © 2017 Amy Wichelow. All rights reserved.

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBAction func signUpButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let _ = user {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomepageViewControllerContainer")
                self.present(vc!, animated: true, completion: nil)
                //self.dismiss(animated: true, completion: nil)
                
            }
        }
        
    }
    
    
    
    
}



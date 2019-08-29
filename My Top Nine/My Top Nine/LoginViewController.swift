//
//  LoginViewController.swift
//  My Top Nine
//
//  Created by Victor  on 8/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import FirebaseAuth
import JGProgressHUD
import FirebaseDatabase

class LoginViewController: UIViewController {
    //Properties
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .dark)
        hud.interactionType = .blockAllTouches
        return hud
    }()
    
    //Actions
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        print("forgotPassword")
        //        performSegue(withIdentifier: "forgot", sender: self)
    }
    
    override func viewDidLoad() {
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 5
        self.hideKeyboardWhenTappedAround()
    }
    
    //Handles logic to when sign in button is tapped
    @IBAction func signInButtonTapped(_ sender: Any) {
        //error handling
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        hud.textLabel.text = "Signing In..."
        hud.show(in: view, animated: true)
        //firebase method to log user in and then performs log in segue
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.hud.dismiss(animated: true)
                print("Failed to sign in with error", error)
                return
            }
            self.hud.dismiss(animated: true)
            let storyboard = UIStoryboard(name: "AppHomepage", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeNavigationController")
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    //handles keyboard functionality
    func textFieldShouldReturn(emailField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        return true
    }
}

//keyboard functionality
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

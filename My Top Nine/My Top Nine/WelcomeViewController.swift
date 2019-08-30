//
//  WelcomeViewController.swift
//  My Top Nine
//
//  Created by Victor  on 8/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit


class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpWithEmailButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "Login", sender: self)
    }
    
    @IBAction func signUpWithEmailButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignUp", sender: self)
    }
    
}

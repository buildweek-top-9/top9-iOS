//
//  SplashScreenViewController.swift
//  My Top Nine
//
//  Created by Victor  on 8/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase


class LaunchScreenViewController: UIViewController {
    
    fileprivate func checkLoggedInUserStatus() {
        //checking for current user
        //if no current user present welcome navigation controlller
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeNavigationController")
                self.present(vc, animated: false, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // splashscreen for delay of 2, then goes to home
        checkLoggedInUserStatus()
        perform(#selector(LaunchScreenViewController.showmainmenu), with: nil, afterDelay: 2)
    }
    
    
    // go to home screen of app
    @objc func showmainmenu(){
        // after delay shows home
        performSegue(withIdentifier: "SplashMain", sender: self)
    }
    
    
}

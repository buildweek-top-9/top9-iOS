//
//  Service.swift
//  My Top Nine
//
//  Created by Victor  on 8/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class Service {
    static func showAlert(on: UIViewController, style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [ UIAlertAction(title: "OK", style: .default, handler: nil)], completion: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        on.present(alert, animated: true, completion: completion)
    }

}

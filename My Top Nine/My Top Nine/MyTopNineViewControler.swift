//
//  MyTopNineViewControler.swift
//  My Top Nine
//
//  Created by Victor  on 8/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth
import JGProgressHUD

class MyTopNineViewController: UIViewController {
    
    var ref: DatabaseReference!
    var myTopNine: [Category] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        hud.textLabel.text = "Loading Top Nine..."
        hud.show(in: view, animated: true)
        addCategoryToArray()
    }
    
    let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        return hud
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func addCategoryToArray() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        ref = Database.database().reference().child("users").child(uid).child("MyTopNine")
        ref.observe(.value) { (snapShot) in
            if snapShot.childrenCount > 0 {
                self.myTopNine.removeAll()
                for myTopNine in snapShot.children.allObjects as! [DataSnapshot] {
                    let categoryObject = myTopNine.value as? [String: AnyObject]
                    guard let categoryName = categoryObject?["category"] as? String else {
                        print("name not returned")
                        return
                    }
                    print("got back data")
                    let category = Category(rawValue: categoryName)
                    self.myTopNine.append(category!)
                    self.hud.dismiss(animated: true)
                    self.collectionView.reloadData()
                    print("finished reloading data")
                }
            } else {
                print("no children")
                self.hud.dismiss()
            }
        }
    }
}

extension MyTopNineViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myTopNine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCategoryCell", for: indexPath) as? MyTopNineCollectionViewCell else { return UICollectionViewCell() }
        
        let category = myTopNine[indexPath.item]
        let imageName = category.rawValue
        
        cell.myTopNineImageView.image = UIImage(named: "\(imageName)")
        return cell
    }
    
    
}

//
//  TopNineDetailViewController.swift
//  My Top Nine
//
//  Created by Dillon P on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class TopNineDetailViewController: UIViewController {
    
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var topNineCollectionView: UICollectionView!
    @IBOutlet weak var connectCollectionView: UICollectionView!
    
    
    var item: Category?
    var ref: DatabaseReference!
    var categoryName: String?
    var items: [String] = ["Billions", "NathanForYou", "BreakingBad", "DeadToMe", "GOT", "StrangerThings", "MadMen", "BlackMirror", "Californiacation"]
    var friends: [String] = ["jake", "grace", "john", "luke", "lucy", "michael"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(topNineCollectionView)
        self.view.addSubview(connectCollectionView)
        categoryNameLabel.text = categoryName
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        ref = Database.database().reference().child("users").child(uid).child("MyTopNine")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToTopNineButtonPressed(_ sender: Any) {
        guard let key = ref.childByAutoId().key else {return}
        guard let category = item else {return}
        let object = ["category": category.rawValue]
        ref.child(key).setValue(object)
        Service.showAlert(on: self, style: .alert, title: "Category Saved!", message: "Successfully added \(category.rawValue) to watchlist")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = categoryName {
            categoryNameLabel.text = name
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}


extension TopNineDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topNineCollectionView {
            return items.count
        }
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.topNineCollectionView {
            guard let cellA = topNineCollectionView.dequeueReusableCell(withReuseIdentifier: "topNineItemCell", for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
            
            let item = items[indexPath.item]
            
            cellA.topNineItemImageView.image = UIImage(named: "detailCellBg")
            
            return cellA
        } else {
            guard let cellB = connectCollectionView.dequeueReusableCell(withReuseIdentifier: "friendCell", for: indexPath) as? FriendCollectionViewCell else { return UICollectionViewCell() }
            
            let friend = friends[indexPath.item]
            
            cellB.friendImage.image = UIImage(named: "\(friend)")
            
            return cellB
        }
    }

}

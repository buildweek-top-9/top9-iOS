//
//  TopNineDetailViewController.swift
//  My Top Nine
//
//  Created by Dillon P on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TopNineDetailViewController: UIViewController {
    
    @IBOutlet weak var pageNameLabel: UILabel!
    @IBOutlet weak var topNineCollectionView: UICollectionView!
    @IBOutlet weak var connectCollectionView: UICollectionView!
    
    
    
    
    
    var itemName: String?
    var items: [String] = ["Billions", "NathanForYou", "BreakingBad", "DeadToMe", "GOT", "StrangerThings", "MadMen", "BlackMirror", "Californiacation"]
    var friends: [String] = ["jake", "grace", "john", "luke", "lucy", "michael"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(topNineCollectionView)
        self.view.addSubview(connectCollectionView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = itemName {
            pageNameLabel.text = name
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
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

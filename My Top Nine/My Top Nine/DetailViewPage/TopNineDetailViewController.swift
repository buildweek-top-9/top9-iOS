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
    
    
    var itemName: String?
    var items: [String] = ["Billions", "NathanForyou", "BreakingBad"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

}

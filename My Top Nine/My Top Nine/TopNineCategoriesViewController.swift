//
//  TopNineCategoriesViewController.swift
//  My Top Nine
//
//  Created by Dillon P on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class TopNineCategoriesViewController: UIViewController {

    var categories: [Category] = [.friends, .movies, .music, .sports]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TopNineCategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let category = categories[indexPath.item]
        let imageName = category.rawValue
    
        cell.categoryImage.image = UIImage(named: "\(imageName)")
        return cell
    }
    
    
}

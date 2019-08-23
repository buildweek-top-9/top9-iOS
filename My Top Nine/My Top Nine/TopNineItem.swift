//
//  TopNineItem.swift
//  My Top Nine
//
//  Created by Dillon P on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum Category {
    case movies
    case sports
    case friends
    case tvShows
    case hobbies
    case books
    case music
}

struct TopNineItem {
    var category: Category
    var itemName: String
    var image: UIImage
    var rank: Int
}

//
//  TopNineItem.swift
//  My Top Nine
//
//  Created by Dillon P on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum Category: String {
    case movies = "MOVIES"
    case sports = "SPORTS"
    case friends = "FRIENDS"
    case tvShows = "TV SHOWS"
    case hobbies = "HOBBIES"
    case books = "BOOKS"
    case music = "MUSIC"
    case foods = "FOODS"
    case places = "PLACES"
}

struct TopNineItem {
    var category: Category
    var itemName: String
    var image: UIImage
    var rank: Int
}

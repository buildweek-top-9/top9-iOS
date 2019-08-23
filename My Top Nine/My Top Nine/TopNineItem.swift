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
    case movies = "movies"
    case sports = "sports"
    case friends = "friends"
    case tvShows = "tvshows"
    case hobbies = "hobbies"
    case books = "books"
    case music = "music"
    case foods = "foods"
    case places = "places"
}

struct TopNineItem {
    var category: Category
    var itemName: String
    var image: UIImage
    var rank: Int
}

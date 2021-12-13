//
//  DishCategory.swift
//  Foodie
//
//  Created by Alisena Mudaber on 9/22/21.
//

import Foundation

struct ListTitle: Decodable {
    let title: String
}

struct DishCategory: Decodable {
    let id: String?
    let title: String?
    let image: String?
   // var description: String? = nil
}

struct Dish: Decodable {
    let id, name, description, image: String?
    
}




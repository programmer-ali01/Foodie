//
//  AllDishes.swift
//  Foodie
//
//  Created by Alisena Mudaber on 12/5/21.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}

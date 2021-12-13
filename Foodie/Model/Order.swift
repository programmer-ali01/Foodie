//
//  Order.swift
//  Foodie
//
//  Created by Alisena Mudaber on 12/5/21.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}

//
//  ApiResponse.swift
//  Foodie
//
//  Created by Alisena Mudaber on 12/5/21.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}

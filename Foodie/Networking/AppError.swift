//
//  AppError.swift
//  Foodie
//
//  Created by Alisena Mudaber on 12/5/21.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case attachmentInvalidURL
    case serverError(String)
    
    
    var errorDescription: String? {
        switch self {
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknown reasons"
        case .attachmentInvalidURL:
            return "Invalid url"
        case .serverError(let error):
            return error
        }
    }
}

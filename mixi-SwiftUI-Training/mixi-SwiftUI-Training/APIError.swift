//
//  APIError.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import Foundation

enum APIError: Error, Equatable {
    case decodingError
    case badResponse
    case unexpected(_ error: Error)
    
    static func == (lhs: APIError, rhs: APIError) -> Bool {
        lhs.localizedDescription == rhs.localizedDescription
    }
}

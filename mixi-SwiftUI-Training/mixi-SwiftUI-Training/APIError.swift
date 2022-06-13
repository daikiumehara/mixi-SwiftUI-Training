//
//  APIError.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import Foundation

enum APIError: Error {
    case missDecode
    case badResponse
    case unexpected
}

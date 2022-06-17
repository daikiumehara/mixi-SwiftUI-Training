//
//  User.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/11.
//

import Foundation

struct User: Codable {
    var name: String
    var imageURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageURL = "avatarUrl"
    }
}

//
//  User.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/11.
//

import Foundation

struct User: Decodable {
    let name: String
    let avatarURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarURL = "avatarUrl"
    }
}

//
//  Stateful.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/15.
//

import Foundation

enum Stateful<T> {
    case idle
    case loading
    case failed(APIError)
    case loaded(T)
}

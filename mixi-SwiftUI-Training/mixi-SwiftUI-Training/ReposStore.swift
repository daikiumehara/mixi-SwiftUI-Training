//
//  ReposStore.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import Foundation

@MainActor
class ReposStore: ObservableObject {
    @Published private(set) var repos = [Repo]()
    
    func loadRepos() async {
        try! await Task.sleep(nanoseconds: 1_000_000_000)
        self.repos = [.mock1, .mock2, .mock3, .mock4, .mock5]
    }
}

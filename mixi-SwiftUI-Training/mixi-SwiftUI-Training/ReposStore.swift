//
//  ReposStore.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import Foundation

class ReposStore: ObservableObject {
    @Published private(set) var repos = [Repo]()
    
    func loadRepos() async {
        try! await Task.sleep(nanoseconds: 1_000_000_000)
        
<<<<<<< HEAD
        repos = [.mock1, .mock2, .mock3, .mock4, .mock5]
=======
        let result = await GitHubClient.fetchData()
        switch result {
        case .success(let repos):
            state = .loaded(repos)
        case .failure(let error):
            state = .failed(error)
        }
        
>>>>>>> 9981bbe (viewModelの中身を定義しました)
    }
}

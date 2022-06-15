//
//  MockRepoRepository.swift
//  mixi-SwiftUI-TrainingTests
//
//  Created by 梅原 奈輝 on 2022/06/15.
//

import Foundation
@testable import mixi_SwiftUI_Training

struct MockRepoRepository: RepoRepository {
    let repos: [Repo]
    
    init(repos: [Repo]) {
        self.repos = repos
    }
    
    func fetchRepos() async -> Result<[Repo], APIError> {
        return .success(repos)
    }
}

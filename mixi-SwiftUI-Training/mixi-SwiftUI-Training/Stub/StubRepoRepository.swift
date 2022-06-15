//
//  MockRepoRepository.swift
//  mixi-SwiftUI-TrainingTests
//
//  Created by 梅原 奈輝 on 2022/06/15.
//

import Foundation
@testable import mixi_SwiftUI_Training

struct StubRepoRepository: RepoRepository {
    let state: Stateful<[Repo]>
    
    init(state: Stateful<[Repo]>) {
        self.state = state
    }
    
    func fetchRepos() async -> Result<[Repo], APIError> {
        switch state {
        case let .loaded(repos):
            return .success(repos)
        case let .failed(error):
            return .failure(error)
        default:
            return .success([])
        }
    }
}

//
//  mixi_SwiftUI_TrainingTests.swift
//  mixi-SwiftUI-TrainingTests
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import XCTest
@testable import mixi_SwiftUI_Training

class RepoListViewModelTests: XCTestCase {
    @MainActor func test_onAppear_正常系() {
        let viewModel = RepoListViewModel(
            repoRepository: StubRepoRepository(state: .loaded([.mock1, .mock2]))
        )
        
        DispatchQueue.main.async {
            viewModel.onAppear()
            switch viewModel.state {
            case let .loaded(repos):
                XCTAssertEqual(repos, [Repo.mock1, Repo.mock2])
            default:
                XCTFail()
            }
        }
    }
    
    @MainActor func test_onAppear_異常系() {
        let viewModel = RepoListViewModel(
            repoRepository: StubRepoRepository(state: .failed(.badResponse))
        )
        
        DispatchQueue.main.async {
            viewModel.onAppear()
            switch viewModel.state {
            case let .failed(error):
                XCTAssertEqual(error, APIError.badResponse)
            default:
                XCTFail()
            }
        }
    }
}

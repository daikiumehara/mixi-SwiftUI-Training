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
            repoRepository: MockRepoRepository(repos: [.mock1, .mock2])
        )
        
        viewModel.onAppear()
        
        switch viewModel.state {
        case let .loaded(repos):
            XCTAssertEqual(repos, [Repo.mock1, Repo.mock2])
        default:
            XCTFail()
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

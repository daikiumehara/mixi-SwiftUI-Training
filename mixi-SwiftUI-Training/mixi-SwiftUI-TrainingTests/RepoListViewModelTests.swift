//
//  mixi_SwiftUI_TrainingTests.swift
//  mixi-SwiftUI-TrainingTests
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import XCTest
import Combine
@testable import mixi_SwiftUI_Training

class RepoListViewModelTests: XCTestCase {
    var cancellables = [AnyCancellable]()
    
    override func tearDownWithError() throws {
        cancellables.forEach {
            $0.cancel()
        }
    }
    
    @MainActor func test_onAppear_正常系() {
        let exp = makeExpectation(#function)
        let viewModel = RepoListViewModel(
            repoRepository: StubRepoRepository(state: .loaded([.mock1, .mock2]))
        )
        var counter = 0
        
        let cancellable = viewModel.$state
            .sink { state in
                counter += 1
                switch counter {
                case 1:
                    switch state {
                    case .idle:
                        break
                    default:
                        XCTFail()
                    }
                case 2:
                    switch state {
                    case .loading:
                        break
                    default:
                        XCTFail()
                    }
                case 3:
                    switch state {
                    case let .loaded(repos):
                        XCTAssertEqual(repos, [Repo.mock1, Repo.mock2])
                        exp.fulfill()
                    default:
                        XCTFail()
                    }
                default:
                    XCTFail()
                }
            }
        
        cancellables.append(cancellable)
        viewModel.onAppear()
        wait(for: [exp], timeout: 5.0)
    }
    
    @MainActor func test_onAppear_異常系() {
        let exp = makeExpectation(#function)
        let viewModel = RepoListViewModel(
            repoRepository: StubRepoRepository(state: .failed(.badResponse))
        )
        var counter = 0
        
        let cancellable = viewModel.$state
            .sink { state in
                counter += 1
                switch counter {
                case 1:
                    switch state {
                    case .idle:
                        break
                    default:
                        XCTFail()
                    }
                case 2:
                    switch state {
                    case .loading:
                        break
                    default:
                        XCTFail()
                    }
                case 3:
                    switch state {
                    case let .failed(error):
                        if error == .badResponse {
                            XCTAssertTrue(true)
                        } else {
                            XCTFail()
                        }
                        exp.fulfill()
                    default:
                        XCTFail()
                    }
                default:
                    XCTFail()
                }
            }
        
        cancellables.append(cancellable)
        viewModel.onAppear()
        wait(for: [exp], timeout: 5.0)
    }
    
    private func makeExpectation(_ funcName: String) -> XCTestExpectation {
        return XCTestExpectation(description: "\(funcName)のタイムアウト")
    }
}

//
//  ContentView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import SwiftUI

struct RepoListView: View {
    @StateObject private var viewModel: RepoListViewModel
    
    init(repoListViewModel: RepoListViewModel) {
        _viewModel = StateObject(wrappedValue: repoListViewModel)
    }
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView("loading...")
                case .loaded(let repos):
                    if repos.isEmpty {
                        Text("No repositories")
                            .bold()
                    } else {
                        List(repos) { repo in
                            NavigationLink {
                                RepoDetailView(repo: repo)
                            } label: {
                                RepoRow(repo: repo)
                            }
                        }
                    }
                case .failed(_):
                    ErrorView {
                        viewModel.onRetryButtonTapped()
                    }
                }
            }
            .navigationTitle("Repositories")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RepoListView(
                repoListViewModel: RepoListViewModel(
                    repoRepository: StubRepoRepository(state: .loaded([.mock1, .mock2, .mock3, .mock4, .mock5]))
                )
            )
            RepoListView(
                repoListViewModel: RepoListViewModel(
                    repoRepository: StubRepoRepository(state: .loaded([]))
                )
            )
            RepoListView(
                repoListViewModel: RepoListViewModel(
                    repoRepository: StubRepoRepository(state: .failed(.badResponse) )
                )
            )
        }
    }
}

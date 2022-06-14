//
//  GitHubClient.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import Foundation

struct GitHubClient {
    static func fetchData() async -> Result<[Repo], Error> {
        let url = URL(string: "https://api.github.com/orgs/mixigroup/repos")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                return .failure(APIError.badResponse)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let repos = try? decoder.decode([Repo].self, from: data) else {
                return .failure(APIError.decodingError)
            }
            return .success(repos)
        } catch {
            return .failure(APIError.unexpected(error))
        }
    }
}

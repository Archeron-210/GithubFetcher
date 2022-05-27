//
//  RepositoryService.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import Foundation
import Moya

enum RepositoryService {
    case showRepositories(searchText: String)
    case showBranches(repositoryFullName: String)
    case showContributors(repositoryFullName: String)
}

extension RepositoryService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com/")!
    }

    var path: String {
        switch self {
        case .showRepositories:
            return "/search/repositories"
        case .showBranches(repositoryFullName: let repositoryFullName):
            return "\(repositoryFullName)/branches"
        case .showContributors(repositoryFullName: let repositoryFullName):
            return "\(repositoryFullName)/contributors"
        }
    }

    var method: Moya.Method {
        switch self {
        case .showContributors, .showBranches, .showRepositories:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .showRepositories(searchText: let searchText):
            return .requestParameters(parameters: ["q" : searchText], encoding: URLEncoding.queryString)
        case .showBranches, .showContributors:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }

}

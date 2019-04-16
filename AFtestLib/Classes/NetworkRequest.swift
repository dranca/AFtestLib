//
//  NetworkRequest.swift
//  AFtestLib
//
//  Created by Alexandru Dranca on 16/04/2019.
//

import Foundation

public class NetworkRequest {
    public init (withParam: String) {}
    public func performRequest(completion: @escaping (String) -> ()) {
        let request = APIRequest(method: .get, path: "posts")
        
        APIClient().perform(request) { (result) in
            switch result {
            case .success(let response):
                if let response = try? response.decode(to: [Post].self) {
                    let posts = response.body
                    completion("Received posts: \(posts.first?.title ?? "")")
                } else {
                    completion("Failed to decode response")
                }
            case .failure:
                completion("Error perform network request")
            }
        }
    }
    
    public func test() {
        print("test")
    }
}

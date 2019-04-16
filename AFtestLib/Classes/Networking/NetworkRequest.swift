//
//  NetworkRequest.swift
//  AFtestLib
//
//  Created by Alexandru Dranca on 16/04/2019.
//

import Foundation

public class NetworkRequest {
    public init (withParam: String) {}
    public func performRequest(success: @escaping ([Post]) -> (), failure: @escaping((String) -> ())) {
        let request = APIRequest(method: .get, path: "posts")
        
        APIClient().perform(request) { (result) in
            switch result {
            case .success(let response):
                if let response = try? response.decode(to: [Post].self) {
                    let posts = response.body
                    success(posts)
                } else {
                    failure("Failed to decode response")
                }
            case .failure:
                failure("🚨💣💥Error perform network request")
            }
        }
    }
    
    public func test() {
        print("test")
    }
}

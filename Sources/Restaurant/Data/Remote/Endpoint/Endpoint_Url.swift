//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation

public struct EndpointModule {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension EndpointModule {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = (Bundle.main.infoDictionary?["BaseUrl"]  as? String ?? "Base url not found")
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "Content-Type": "application/json",
        ]
    }
}

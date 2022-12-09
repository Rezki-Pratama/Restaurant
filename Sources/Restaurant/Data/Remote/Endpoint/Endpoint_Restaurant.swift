//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation

extension EndpointModule {
    public static func restaurant(search: String) -> Self {
        if (search.isEmpty) {
            return EndpointModule(path: "/list")
        } else {
            return EndpointModule(path: "/search", queryItems: [
                URLQueryItem(name: "q", value: search)
            ])

        }
    }

    public static func detailRestaurant(id: String) -> Self {
        return EndpointModule(path: "/detail/\(id)")
    }
  
    public static func storeCustomerReview() -> Self {
        return EndpointModule(path: "/review")
    }
}

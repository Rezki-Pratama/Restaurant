//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
import Combine
import Alamofire
import Foundation
 
public struct GetRestaurantRemoteDataSource : DataSource {
    public typealias Request = Any
    
    public typealias Response = ViewData<RestaurantResponse>
  
    public init() {}
    
    public func execute(request: Any?) -> AnyPublisher<ViewData<RestaurantResponse>, Error> {
      
      let _endpoint = EndpointModule.detailRestaurant(id: request as? String ?? "")
      
      var urlRequest = URLRequest(url: _endpoint.url)
                
        _endpoint.headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
      
        return Future<ViewData<RestaurantResponse>, Error> { completion in
          AF.request(urlRequest)
          .validate()
          .responseDecodable(of: ViewData<RestaurantResponse>.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure:
              completion(.failure(URLError.invalidResponse))
            }
          }
        }.eraseToAnyPublisher()
    }
}

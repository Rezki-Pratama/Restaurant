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
 
public struct GetRestaurantsRemoteDataSource : DataSource {
    public typealias Request = Any
    
    public typealias Response = ViewListData<RestaurantResponse>
  
    public init() {}
    
    public func execute(request: Any?) -> AnyPublisher<ViewListData<RestaurantResponse>, Error> {
      
      let _endpoint = EndpointModule.restaurant(search: request as? String ?? "")
      
      var urlRequest = URLRequest(url: _endpoint.url)
                
        _endpoint.headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
      
        return Future<ViewListData<RestaurantResponse>, Error> { completion in
          AF.request(urlRequest)
          .validate()
          .responseDecodable(of: ViewListData<RestaurantResponse>.self) { response in
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

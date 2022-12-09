//
//  File.swift
//  
//
//  Created by Hendy Rudy on 05/12/22.
//

import Core
import Combine
import Alamofire
import Foundation

public class StoreRestaurantRemoteDataSource: DataSource {  
  
  public typealias Request = Any
  
  public typealias Response = ViewMessage
  
  public init() {}
  
  public func execute(request: Any?) -> AnyPublisher<ViewMessage, Error> {
    
    let _endpoint = EndpointModule.storeCustomerReview()
    var urlRequest = URLRequest(url: _endpoint.url)
    let body = try! JSONSerialization.data(withJSONObject: request as! [String: Any])
    urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
    urlRequest.httpBody = body
    urlRequest.httpMethod = "POST"
            
    _endpoint.headers.forEach { key, value in
        if let value = value as? String {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    return Future<ViewMessage, Error> { completion in
          AF.request(urlRequest)
          .validate()
          .responseDecodable(of: ViewMessage.self) { response in
            print(response)
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

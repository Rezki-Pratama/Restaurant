//
//  File.swift
//
//
//  Created by Reski Pratama on 30/11/22.
//

import Core
import Combine
 
public struct StoreRestaurantRepository<
    RemoteDataSource: DataSource> : Repository
where
    RemoteDataSource.Response == ViewMessage {
  
    public typealias Request = [String: Any]
    public typealias Response = String
    
    private let _remoteDataSource: RemoteDataSource
    
    public init(
        remoteDataSource: RemoteDataSource
    ) {
        _remoteDataSource = remoteDataSource
    }
    
      public func execute(request: [String: Any]?) -> AnyPublisher<String, Error> {
      return _remoteDataSource.execute(request: request as? RemoteDataSource.Request)
        .map {
          return $0.message
        }.eraseToAnyPublisher()
    }
}

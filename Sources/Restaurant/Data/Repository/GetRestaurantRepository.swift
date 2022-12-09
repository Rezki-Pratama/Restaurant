//
//  File.swift
//
//
//  Created by Reski Pratama on 30/11/22.
//

import Core
import Combine
 
public struct GetRestaurantRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository
where
    RemoteDataSource.Response == ViewData<RestaurantResponse>,
    Transformer.Response == RestaurantResponse,
    Transformer.Domain == RestaurantDomainModel {
  
    public typealias Request = Any
    public typealias Response = RestaurantDomainModel
    
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
        
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<RestaurantDomainModel, Error> {
      return _remoteDataSource.execute(request: request as? RemoteDataSource.Request)
        .map {
          _mapper.transformResponseToDomain(response: $0.restaurant)
        }.eraseToAnyPublisher()
    }
}

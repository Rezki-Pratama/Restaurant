//
//  File.swift
//  
//
//  Created by Reski Pratama on 30/11/22.
//

import Core
import Combine
 
public struct GetRestaurantsRepository<
    RestaurantLocalDataSource: LocalDataSource,
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository
where
  
    RestaurantLocalDataSource.Response == RestaurantModuleEntity,
    RemoteDataSource.Response == ViewListData<RestaurantResponse>,
    Transformer.Response == [RestaurantResponse],
    Transformer.Entity == [RestaurantModuleEntity],
    Transformer.Domain == [RestaurantDomainModel] {
  
    public typealias Request = Any
    public typealias Response = [RestaurantDomainModel]
    
    private let _localDataSource: RestaurantLocalDataSource
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        localDataSource: RestaurantLocalDataSource,
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
        
        _localDataSource = localDataSource
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<[RestaurantDomainModel], Error> {
      return _localDataSource.list(search: request as! String)
          .flatMap { result -> AnyPublisher<[RestaurantDomainModel], Error> in
            if result.isEmpty {
              return _remoteDataSource.execute(request: request as? RemoteDataSource.Request)
                .map { _mapper.transformResponseToEntity(response: $0.restaurants) }
                .catch { _ in _localDataSource.list(search: request as! String) }
                .flatMap { _localDataSource.addAll(entities: $0) }
                .filter { $0 }
                .flatMap { _ in _localDataSource.list(search: request as! String)
                  .map { _mapper.transformEntityToDomain(entity: $0) }
                }
                .eraseToAnyPublisher()
            } else {
              return _localDataSource.list(search: request as! String)
                .map { _mapper.transformEntityToDomain(entity: $0) }
                .eraseToAnyPublisher()
            }
          }.eraseToAnyPublisher()
    }
}

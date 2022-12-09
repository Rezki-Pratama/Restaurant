//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
import Combine
import RealmSwift
import Foundation
 
 

public struct GetRestaurantLocalDataSource: LocalDataSource {
    
    public typealias Request = Any
    public typealias Response = RestaurantModuleEntity
    
    private let _realm: Realm
    
    public init(realm: Realm) {
        _realm = realm
    }
  
    public func list(search: String) -> AnyPublisher<[RestaurantModuleEntity], Error> {
      return Future<[RestaurantModuleEntity], Error> { completion in
        let restaurants: Results<RestaurantModuleEntity> = {
          _realm.objects(RestaurantModuleEntity.self)
            .sorted(byKeyPath: "name", ascending: true).filter("name LIKE %@", "*\(String(describing: search))*")
        }()
        completion(.success(restaurants.toArray(ofType: RestaurantModuleEntity.self)))
        
      }.eraseToAnyPublisher()
    }
    
    public func addAll(entities: [RestaurantModuleEntity]) -> AnyPublisher<Bool, Error> {
      return Future<Bool, Error> { completion in
          do {
              try _realm.write {
                  for category in entities {
                      _realm.add(category, update: .all)
                  }
                  completion(.success(true))
              }
          } catch {
              completion(.failure(DatabaseError.requestFailed))
          }
          
      }.eraseToAnyPublisher()
    }
    
    public func add(entities: RestaurantModuleEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                try _realm.write {
                    _realm.add(entities, update: .all)
                    completion(.success(true))
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
            
        }.eraseToAnyPublisher()
    }
    
    public func get(id: String) -> AnyPublisher<RestaurantModuleEntity, Error> {
        fatalError()
    }
  
    public func update(id: Int, entity: RestaurantModuleEntity) -> AnyPublisher<Bool, Error> {
      fatalError()
    }
    
    public func delete(entities: RestaurantModuleEntity) -> AnyPublisher<Bool, Error> {
      fatalError()
    }
}

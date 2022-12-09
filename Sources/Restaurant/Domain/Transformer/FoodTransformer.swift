//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
 
public struct FoodTransformer: Mapper {
  
    public typealias Response = [Foods]
    public typealias Entity = Any
    public typealias Domain = [FoodsDomainModel]
    
    public init() {}
    
  public func transformResponseToEntity(response: [Foods]) -> Any {
    fatalError()
  }
  
  public func transformEntityToDomain(entity: Any) -> [FoodsDomainModel] {
    fatalError()
  }
  
  public func transformResponseToDomain(response: [Foods]) -> [FoodsDomainModel] {
    return response.map{ result in
      return FoodsDomainModel(
       name: result.name ?? ""
      )
    }
  }
  
  public func transformDomainToEntity(domain: [FoodsDomainModel]) -> Any {
    fatalError()
  }
  
}

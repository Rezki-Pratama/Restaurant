//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
 
public struct DrinkTransformer: Mapper {
  
  public typealias Response = [Drinks]
  public typealias Entity = Any
  public typealias Domain = [DrinksDomainModel]
  
  public init() {}
    
  public func transformResponseToEntity(response: [Drinks]) -> Any {
    fatalError()
  }
  
  public func transformEntityToDomain(entity: Any) -> [DrinksDomainModel] {
    fatalError()
  }
  
  public func transformResponseToDomain(response: [Drinks]) -> [DrinksDomainModel] {
    return response.map{ result in
      return DrinksDomainModel(
       name: result.name ?? ""
      )
    }
  }
  
  public func transformDomainToEntity(domain: [DrinksDomainModel]) -> Any {
    fatalError()
  }
  
}

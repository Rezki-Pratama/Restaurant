//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
 
public struct CategoriesTransformer: Mapper {
  
  public typealias Response = [Categories]
  public typealias Entity = Any
  public typealias Domain = [CategoriesDomainModel]
  
  public init() {}
    
  public func transformResponseToEntity(response: [Categories]) -> Any {
    fatalError()
  }
  
  public func transformEntityToDomain(entity: Any) -> [CategoriesDomainModel] {
    fatalError()
  }
  
  public func transformResponseToDomain(response: [Categories]) -> [CategoriesDomainModel] {
    return response.map{ result in
      return CategoriesDomainModel(
       name: result.name ?? ""
      )
    }
  }
  
  public func transformDomainToEntity(domain: [CategoriesDomainModel]) -> Any {
    fatalError()
  }
  
}

//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
 
public struct CustomerReviewTransformer: Mapper {
  
  public typealias Response = [CustomerReviews]
  public typealias Entity = Any
  public typealias Domain = [CustomerReviewsDomainModel]
  
  public init() {}
    
  public func transformResponseToEntity(response: [CustomerReviews]) -> Any {
    fatalError()
  }
  
  public func transformEntityToDomain(entity: Any) -> [CustomerReviewsDomainModel] {
    fatalError()
  }
  
  public func transformResponseToDomain(response: [CustomerReviews]) -> [CustomerReviewsDomainModel] {
    return response.map{ result in
      return CustomerReviewsDomainModel(
       name: result.name ?? "",
       review: result.review ?? "",
       date: result.date ?? ""
      )
    }
  }
  
  public func transformDomainToEntity(domain: [CustomerReviewsDomainModel]) -> Any {
    fatalError()
  }
}

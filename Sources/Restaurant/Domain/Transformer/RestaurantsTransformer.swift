//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
 
public struct RestaurantsTransformer: Mapper {
  
    public typealias Response = [RestaurantResponse]
    public typealias Entity = [RestaurantModuleEntity]
    public typealias Domain = [RestaurantDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(response: [RestaurantResponse]) -> [RestaurantModuleEntity] {
        return response.map { result in
          let restaurant = RestaurantModuleEntity()
          restaurant.id = result.id ?? ""
          restaurant.name = result.name ?? ""
          restaurant.desc = result.description ?? ""
          restaurant.pictureId = result.pictureId ?? ""
          restaurant.city = result.city ?? ""
          restaurant.rating = result.rating ?? 0.0
          restaurant.address = result.address ?? ""
          return restaurant
        }
    }
    
    public func transformEntityToDomain(entity: [RestaurantModuleEntity]) -> [RestaurantDomainModel] {
        return entity.map { result in
          return RestaurantDomainModel(
            id: result.id,
            name: result.name,
            pictureId: result.pictureId,
            description: result.desc,
            city: result.city,
            rating: result.rating,
            address: result.address,
            customerReviews: [],
            categories: [],
            menus: nil
          )
        }
    }
  
    public func transformResponseToDomain(response: [RestaurantResponse]) -> [RestaurantDomainModel] {
      fatalError()
    }
  
    public func transformDomainToEntity(domain: [RestaurantDomainModel]) -> [RestaurantModuleEntity] {
      fatalError()
    }
    
}

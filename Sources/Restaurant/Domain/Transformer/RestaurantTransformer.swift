//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Core
 
public struct RestaurantTransformer: Mapper {
    
    public typealias Response = RestaurantResponse
    public typealias Entity = RestaurantModuleEntity
    public typealias Domain = RestaurantDomainModel
  
    let customerReviewMapper = CustomerReviewTransformer()
    let drinkMapper = DrinkTransformer()
    let foodMapper = FoodTransformer()
    let categoriesMapper = CategoriesTransformer()
    
    public init() {}
    
  public func transformResponseToEntity(response: RestaurantResponse) -> RestaurantModuleEntity {
    fatalError()
  }
  
  public func transformEntityToDomain(entity: RestaurantModuleEntity) -> RestaurantDomainModel {
    fatalError()
  }
  
  public func transformResponseToDomain(response: RestaurantResponse) -> RestaurantDomainModel {
    return RestaurantDomainModel(
      id: response.id ?? "",
      name: response.name ?? "",
      pictureId: response.pictureId ?? "",
      description: response.description ?? "",
      city: response.city ?? "",
      rating: response.rating ?? 0.0,
      address: response.address ?? "",
      customerReviews: customerReviewMapper.transformResponseToDomain(response: response.customerReviews ?? []),
      categories: categoriesMapper.transformResponseToDomain(response: response.categories ?? []),
      menus: MenusDomainModel(
        foods: foodMapper.transformResponseToDomain(response: response.menus?.foods ?? []),
        drinks: drinkMapper.transformResponseToDomain(response: response.menus?.drinks ?? [])
      )
    )
  }
  
  public func transformDomainToEntity(domain: RestaurantDomainModel) -> RestaurantModuleEntity {
    fatalError()
  }
  
}

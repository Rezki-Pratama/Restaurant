//
//  File.swift
//  
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation

public struct RestaurantDomainModel: Equatable, Identifiable  {
  
    public var id: String = ""
    public var name: String = ""
    public var description: String = ""
    public var pictureId: String = ""
    public var city: String = ""
    public var rating: Double = 0.0
    public var address: String = ""
    public var customerReviews: [CustomerReviewsDomainModel]?
    public var categories: [CategoriesDomainModel]?
    public var menus: MenusDomainModel?
  
    public init(
      id: String,
      name: String,
      pictureId: String,
      description: String,
      city: String,
      rating: Double,
      address: String,
      customerReviews: [CustomerReviewsDomainModel]?,
      categories: [CategoriesDomainModel]?,
      menus: MenusDomainModel?
    ) {
      self.id = id
      self.name = name
      self.description = description
      self.pictureId = pictureId
      self.city = city
      self.rating = rating
      self.address = address
      self.customerReviews = customerReviews
      self.categories = categories
      self.menus = menus
     }
}

public struct CustomerReviewsDomainModel: Hashable, Codable, Identifiable {
  public var id = UUID().uuidString
  public var name: String?
  public var review: String?
  public var date: String?
}

public struct CategoriesDomainModel: Hashable, Codable {
    public let name: String
}

public struct MenusDomainModel: Hashable, Codable {
    public let foods: [FoodsDomainModel]
    public let drinks: [DrinksDomainModel]
}

public struct FoodsDomainModel: Hashable, Codable {
    public let name: String
}

public struct DrinksDomainModel: Hashable, Codable {
    public let name: String
}


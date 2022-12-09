//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation

public struct RestaurantResponse: Codable, Identifiable {
    public let id: String?
    public var name: String?
    public var description: String?
    public var pictureId: String?
    public var city: String?
    public var rating: Double?
    public var address: String?
    public var customerReviews: [CustomerReviews]?
    public var categories: [Categories]?
    public var menus: Menus?
    
}

public struct CustomerReviews: Codable {
  public var name: String?
  public var review: String?
  public var date: String?
}

public struct Categories: Codable {
    public var name: String?
}

public struct Menus: Codable {
    public var foods: [Foods]?
    public var drinks: [Drinks]?
}

public struct Foods: Codable {
    public var name: String?
}

public struct Drinks: Codable {
    public var name: String?
}

extension RestaurantResponse {
    public static func fake() -> Self {
        return RestaurantResponse(
          id: "rqdv5juczeskfw1e867",
          name: "Melting Pot",
          description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
          pictureId: "14",
          city: "Medan",
          rating: 4.2,
          address: "Jln. Pandeglang no 19",
          customerReviews: [
          CustomerReviews(
            name: "Ahmad",
            review: "Tidak rekomendasi untuk pelajar!",
            date: "13 November 2022"
          )
          ],
          categories: [
          Categories(
            name: "Italia"
          )
          ],
          menus: Menus(
            foods: [
              Foods(name: "Paket rosemary")
            ],
            drinks: [
              Drinks(name: "Es krim")
            ]
          )
        )
    }
}

//
//  File.swift
//
//
//  Created by Rezki Pratama on 30/11/22.
//

import Foundation

public struct ViewListData<T : Codable> : Codable {
    var error: Bool = false
    var message: String = ""
    var restaurants : [T]
}

public struct ViewData<T : Codable> : Codable {
    var error: Bool = false
    var message: String = ""
    var restaurant : T
}

public struct ViewMessage : Codable {
    var error: Bool = false
    var message: String = ""
}

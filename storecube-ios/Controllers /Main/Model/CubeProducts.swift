//
//  CubeProducts.swift
//  CubeStore
//
//  Created by Радмир Тельман on 12.09.2023.
//

import Foundation

struct CubeProduct: Codable {
    let id: Int
    let name: String
    let imageUrl: URL
    let price: Int
}

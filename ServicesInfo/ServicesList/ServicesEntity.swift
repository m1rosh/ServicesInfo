//
//  ServicesEntity.swift
//  YoulaTestTask
//
//  Created by Сергей Мирошниченко on 26.03.2024.
//

import Foundation

struct ServicesBody: Codable {
    var body: AllServices
    var status: Int
}

struct AllServices: Codable {
    var services: [Service]
}

struct Service: Codable {
    var name: String
    var description: String
    var link: String
    var icon_url: String
    var icon_data: Data?
}


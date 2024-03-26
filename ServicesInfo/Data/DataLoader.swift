//
//  ModelData.swift
//  ServicesInfo
//
//  Created by Сергей Мирошниченко on 25.03.2024.
//
import Foundation

class DataLoader {
    var servicesInfo: ServicesBody = load("result.json")
}

func load<MyStruct: Decodable>(_ filename: String) -> MyStruct {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename)")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(MyStruct.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(MyStruct.self):\n\(error)")
    }
}


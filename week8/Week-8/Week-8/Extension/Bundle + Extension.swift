//
//  Bundle + Extension.swift
//  Week-8
//
//  Created by Kerim Çağlar on 2.04.2024.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil)  else {
            fatalError("Failed to locate \(file) in bundle")
        }
                
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let contents = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return contents
    }
    
}

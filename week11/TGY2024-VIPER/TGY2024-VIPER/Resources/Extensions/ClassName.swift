//
//  ClassName.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 14.05.2024.
//

import UIKit

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol { }

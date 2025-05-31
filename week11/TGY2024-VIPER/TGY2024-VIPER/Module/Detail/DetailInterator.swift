//
//  DetailInterator.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 16.05.2024.
//

import Foundation

protocol DetailInteractorProtocol: AnyObject {
    
}

protocol DetailInteractorOutputProtocol: AnyObject {
    
}

final class DetailInteractor {
    var output: DetailInteractorOutputProtocol?
}

//
//  Environment.swift
//  Frootlo
//
//  Created by BYKEA - Hadi Ali on 30/06/2020.
//  Copyright © 2020 Frootlo. All rights reserved.
//

import Foundation

public enum PlistKey {
    case baseURL
    case apiKey
    
    func value() -> String {
        
        switch self {
            
        case .baseURL:
            return "base_url"
            
        case .apiKey:
            return "api_key"
            
        }
        
    }
    
}

public struct Environment {
    
    fileprivate var infoDictionary: [String: Any] {
        
        get {
            
            if let dictionary = Bundle.main.infoDictionary {
                
                return dictionary
                
            } else {
                
                fatalError("Relevant .plist file not found")
                
            }
            
        }
        
    }
    
    public func configuration(_ key: PlistKey) -> String {
        
        return infoDictionary[key.value()] as! String
        
    }
    
}


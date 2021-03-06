//
//  Author.swift
//  partyRules
//
//  Created by Julien Guillan on 05/01/2020.
//  Copyright © 2020 Julien Guillan. All rights reserved.
//

import Foundation

class Author: CustomStringConvertible, Encodable {
    var id: Int?
    var name: String
    var email: String
    
    init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    var description: String {
        return "{\(self.name), \(self.email)}"
    }
    
    func setName(name: String) -> Void {
        self.name = name
    }
    
    func setEmail(email: String) -> Void {
        self.email = email
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getEmail() -> String {
        return self.email
    }
}

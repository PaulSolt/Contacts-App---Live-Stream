//
//  Contact.swift
//  Contact App
//
//  Created by Paul Solt on 11/25/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import UIKit

class Contact: NSObject, NSCoding {
   
    // Properties
    var firstName: String
    var lastName: String
    var email: String
    var age: Int
    var milePace: Double
    
    // Initializer
    init(firstName: String, lastName: String, email: String, age: Int, milePace: Double) {
        
        // set all properties to default values or passed in values
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.age = age
        self.milePace = milePace
        // init on super
        super.init()
    }
    
    override var description: String {
        return "name: \(firstName) \(lastName) email: \(email) age: \(age) milePace: \(milePace)"
    }
    
    required init(coder decoder: NSCoder) {
        self.firstName = decoder.decodeObjectForKey("firstName") as String
        self.lastName = decoder.decodeObjectForKey("lastName") as String
        self.email = decoder.decodeObjectForKey("email") as String
        self.age = decoder.decodeIntegerForKey("age") as Int
        self.milePace = decoder.decodeDoubleForKey("milePace") as Double
        
        super.init() // super.init(coder:decoder)
    }
    
    func encodeWithCoder(encoder: NSCoder) {
        
        encoder.encodeObject(firstName, forKey: "firstName")
        encoder.encodeObject(lastName, forKey: "lastName")
        encoder.encodeObject(email, forKey: "email")
        encoder.encodeInteger(age, forKey: "age")
        encoder.encodeDouble(milePace, forKey: "milePace")
    }
    
    
    
}

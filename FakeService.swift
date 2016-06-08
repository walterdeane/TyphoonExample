//
//  FakeService.swift
//  Typhoon Play
//
//  Created by Walter Deane on 3/06/2016.
//  Copyright © 2016 Walter Deane. All rights reserved.
//

import Foundation
import Typhoon

@objc public protocol ServiceProtocol:NSObjectProtocol {
    func family() -> [String:Person]
    func addresses(person: Person) -> [String:Address]
}

@objc enum AddressType: Int {
    case Home, Work, Vacation
    
    func string() -> String {
        switch self {
        case .Home:
            return "Home"
        case .Work:
            return "Work"
        case .Vacation:
            return "Vacation"
        }
    }
}

@objc public class Address: NSObject {
    let street1:String
    let street2:String?
    let suburb:String
    let state:String
    let postCode:String
    init(street1:String, street2:String, suburb:String, state: String, postCode:String) {
        self.street1 = street1
        self.street2 = street2
        self.suburb = suburb
        self.state = state
        self.postCode = postCode
    
    }
}

@objc public class Person:NSObject  {
    let firstName:String!
    let middleName:String?
    let surname:String!
    let age:Int!
    init(firstName:String, middleName: String, surname: String, age:Int) {
        self.firstName = firstName
        self.middleName = middleName
        self.surname = surname
        self.age = age
    }
}

@objc class FakeService : NSObject, ServiceProtocol {
    
    func family() -> [String:Person] {
        
        return [NSUUID().UUIDString:Person(firstName: "Walter", middleName: "Lee", surname:"Deane", age: 42),
                NSUUID().UUIDString:Person(firstName: "Karen", middleName: "Elizabeth", surname:"Deane", age: 43),
                NSUUID().UUIDString:Person(firstName: "Siena", middleName: "Lee", surname:"Deane", age: 13),
                NSUUID().UUIDString:Person(firstName: "Alex", middleName: "Riley", surname:"Deane", age: 15)
        ]
    }
    
    func addresses(person: Person) -> [String:Address] {
        return [AddressType.Home.string() : Address(street1:"39 Paxton St", street2: "", suburb: "Frenchs Forest", state: "NSW", postCode: "2086")]
    }
}
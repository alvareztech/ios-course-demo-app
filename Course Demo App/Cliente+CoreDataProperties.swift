//
//  Cliente+CoreDataProperties.swift
//  Course Demo App
//
//  Created by Daniel Alvarez on 10/2/17.
//  Copyright © 2017 ALVAREZ.tech. All rights reserved.
//

import Foundation
import CoreData


extension Cliente {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cliente> {
        return NSFetchRequest<Cliente>(entityName: "Cliente")
    }

    @NSManaged public var apellidos: String?
    @NSManaged public var nombres: String?
    @NSManaged public var representante: Bool

}

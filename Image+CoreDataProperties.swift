//
//  Image+CoreDataProperties.swift
//  MemberGurus
//
//  Created by Nam on 2/14/17.
//  Copyright © 2017 Nam. All rights reserved.
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image");
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var toMember: Member?
    @NSManaged public var toPlatform: Platform?

}

//
//  Member+CoreDataClass.swift
//  MemberGurus
//
//  Created by Nam on 2/14/17.
//  Copyright © 2017 Nam. All rights reserved.
//

import Foundation
import CoreData

@objc(Member)
public class Member: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert() //start calling the function when users insert
        
        self.created = NSDate() //assign the current date when Member entity created
    }
    

}

//
//  MemberCell.swift
//  MemberGurus
//
//  Created by Nam on 2/14/17.
//  Copyright © 2017 Nam. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var platform: UILabel!
    
    func configureCell(member: Member) {
        name.text = member.name
        age.text = "$\(member.age)"
        //platform.text = member.platform
        
    }
    
}

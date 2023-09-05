//
//  Database.swift
//  Followers
//
//  Created by Gugulethu Mhlanga on 2023/08/29.
//

import Foundation
import UIKit

class UserDatabase {
    var profileArray: [Profile] = [
        Profile(profileImage: UIImage(named: "Vegeta")!,
                name: "Vegeta",
                username: "prince_of_saiyans",
                profession: "Prince🤴🏾",
                slogan: "Kakarot is my rival.💪🏾👊🏾💪🏾",
                link: "www.princeofsaiyans.com",
                postCount: 1116,
                followerCount: 221,
                followingCount: 20,
                isFollowing: true),
        
        Profile(profileImage: UIImage(named: "Piccolo")!,
                name: "Piccolo",
                username: "Namekian",
                profession: "Gohan's Sensei🏋🏾",
                slogan: "Push Past Your Limits",
                link: "www.thenamekian.com",
                postCount: 1116,
                followerCount: 221,
                followingCount: 20,
                isFollowing: true)
    ]
}

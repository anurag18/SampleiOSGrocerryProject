//
//  ColorKit.swift
//  NewsTemplate
//
//  Created by Anurag Sharma on 07/03/23.
//

import Foundation
import SwiftUI

class ColorKit {
    static let sharedObject: ColorKit = ColorKit()
    private init() {}
    let background = BgColors()
    let textColor = TextColors()
}

struct BgColors {
    let mainBg = Color(.systemBackground)
    let secondaryBg = Color(.systemGroupedBackground)
}

struct TextColors {
     let headingColor = Color.green
     let subHeadingColor = Color.cyan
     let cardHeadingColor = Color.white
     let cardSubHeadingColor = Color.brown
    let serviceViewHeadingColor = Color.brown
}

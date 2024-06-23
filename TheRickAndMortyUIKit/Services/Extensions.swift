//
//  Extensions.swift
//  TheRickAndMortyUIKit
//
//  Created by Roman Samborskyi on 23.06.2024.
//

import UIKit


extension UIColor {
   static func adaptiveColor() -> UIColor {
        UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .white : .black
        }
    }
}

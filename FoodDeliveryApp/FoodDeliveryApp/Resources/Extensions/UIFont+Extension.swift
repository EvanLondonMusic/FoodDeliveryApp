//
//  UIFont+Extension.swift
//  FoodDeliveryApp
//
//  Created by Evan London on 28.01.2024.
//

import UIKit

extension UIFont {
    enum Roboto {
        enum black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.black, size: size)!
            }
        }
        enum italic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.italic, size: size)!
            }
        }
        enum blackItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.blackItalic, size: size)!
            }
        }
        enum Medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.Medium, size: size)!
            }
        }
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.bold, size: size)!
            }
        }
        enum lightItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.lightItalic, size: size)!
            }
        }
        enum thin {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.thin, size: size)!
            }
        }
        enum light {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.light, size: size)!
            }
        }
        enum regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.regular, size: size)!
            }
        }
        enum mediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.mediumItalic, size: size)!
            }
        }
        enum thinItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.thinItalic, size: size)!
            }
        }
        enum boldItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.boldItalic , size: size)!
            }
        }
    }
}


private extension UIFont {
    enum Constants {
        enum Roboto {
            static let black = "Roboto-Black"
            static let italic = "Roboto-Italic"
            static let blackItalic = "Roboto-BlackItalic"
            static let Medium = "Roboto-Medium"
            static let bold = "Roboto-Bold"
            static let lightItalic = "Roboto-LightItalic"
            static let thin = "Roboto-Thin"
            static let light = "Roboto-Light"
            static let regular = "Roboto-Regular"
            static let mediumItalic = "Roboto-MediumItalic"
            static let thinItalic = "Roboto-ThinItalic"
            static let boldItalic = "Roboto-BoldItalic"
        }
    }
}

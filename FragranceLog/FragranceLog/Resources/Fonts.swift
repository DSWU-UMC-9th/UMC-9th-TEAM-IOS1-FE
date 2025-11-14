//
//  Fonts.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import Foundation
import SwiftUI

extension Font {
    // MARK: - Zen Serif

    enum Zen {
        case regular

        var value: String {
            switch self {
            case .regular:
                return "ZEN-SERIF-Regular"
            }
        }
    }

    static func zen(type: Zen, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }

    static var zen24: Font {
        return .zen(type: .regular, size: 24)
    }

    static var zen20: Font {
        return .zen(type: .regular, size: 20)
    }

    static var zen18: Font {
        return .zen(type: .regular, size: 18)
    }

    static var zen16: Font {
        return .zen(type: .regular, size: 16)
    }

    static var zen12: Font {
        return .zen(type: .regular, size: 12)
    }

    // MARK: - Roboto

    enum Roboto {
        case light
        case regular

        var value: String {
            switch self {
            case .light:
                return "Roboto-Light"
            case .regular:
                return "Roboto-Regular"
            }
        }
    }

    static func roboto(type: Roboto, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }

    static var robotoRegular16: Font {
        return .roboto(type: .regular, size: 16)
    }

    static var robotoRegular14: Font {
        return .roboto(type: .regular, size: 14)
    }

    static var robotoRegular12: Font {
        return .roboto(type: .regular, size: 12)
    }

    static var robotoLight12: Font {
        return .roboto(type: .light, size: 12)
    }
}

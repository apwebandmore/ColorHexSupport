//
//  ColorExtension.swift
//  ColorHexSupport
//
//  Created by Antonio Piantadosi on 16/11/2019.
//

import SwiftUI

extension Color{
    
    init?(hex: String){
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: Double(r), green: Double(g), blue: Double(b))
                    _ = self.opacity(Double(a))
                    return
                }
            }else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 255 / 255

                    self.init(red: Double(r), green: Double(g), blue: Double(b))
                    _ = self.opacity(Double(a))
                    return
                }
            }
        }

        return nil
    }
}


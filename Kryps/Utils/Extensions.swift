//
//  Extensions.swift
//  Kryps
//
//  Created by Aaspreet Dhillon on 2024-11-30.
//

import Foundation
import SwiftUI

extension Color {
    static let background: Color = Color(.gray)
}

extension View {
  @inlinable
  public func reverseMask<Mask: View>(
    alignment: Alignment = .center,
    @ViewBuilder _ mask: () -> Mask
  ) -> some View {
    self.mask {
      Rectangle()
        .overlay(alignment: alignment) {
          mask()
            .blendMode(.destinationOut)
        }
    }
  }
}

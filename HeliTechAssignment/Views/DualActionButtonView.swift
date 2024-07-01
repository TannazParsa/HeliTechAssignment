//
//  DualActionButtonView.swift
//  HeliTechAssignment
//
//  Created by Parsa on 7/1/24.
//

import Foundation
import SwiftUI

struct DualActionButtonView: View {

    let filterAction: () -> Void
    let kaartAction: () -> Void
    let height: CGFloat = 50

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
            .foregroundColor(Color.white.opacity(1.0))
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            HStack(spacing: 0) {
                Button(action: filterAction) {
                    HStack(spacing: 8) {
                      Image(ImageResource.filter)
                        Text("Filter")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                Divider()
                    .background(Color.gray)

                Button(action: kaartAction) {
                    HStack(spacing: 8) {
                      Image(ImageResource.point)
                        Text("Kaart")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
            .padding(.horizontal)

        }.frame(width: 250, height: height)
    }
}

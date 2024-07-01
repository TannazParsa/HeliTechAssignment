//
//  ListItem.swift
//
//
//  Created by Parsa on 6/29/24.
//
import Models
import SwiftUI

//MARK: - View

/// A view representing a list item with details and an image.
public struct ListItem: SwiftUI.View {
    private let model: Self.Model
    
    /// Initializes a new list item with the given model.
    /// - Parameter model: The model containing data for the list item.
    public init(model: Self.Model) {
        self.model = model
    }
    
    /// The body of the view, defining its UI elements.
    public var body: some SwiftUI.View {
        GeometryReader { geometry in
            VStack(spacing: 8) {
                ZStack(alignment: .bottomTrailing) {
                    // Asynchronous image loading with a placeholder
                    AsyncImage(url: model.url) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: geometry.size.width - 10, height: 200)
                    .cornerRadius(8)
                    .clipped()
                    .padding(.all, 8)
                    
                    // Price tag overlay
                    Image("Rectangle")
                        .resizable()
                        .frame(width: 120, height: 40)
                        .aspectRatio(contentMode: .fit)
                    
                    Text(model.price)
                        .lineLimit(2)
                        .font(.system(size: 15))
                        .offset(x: -30, y: -10)
                }

                VStack(spacing: 8) {
                    // Title
                    HStack(spacing: -8) {
                        Text(model.title)
                            .lineLimit(2)
                            .font(.system(size: 15))
                            .foregroundColor(.purple)
                            .offset(x: 8, y: 0)
                        Spacer()
                    }
                    
                    // Slug
                    HStack(spacing: .zero) {
                        Text(model.slug)
                            .lineLimit(3)
                            .font(.system(size: 13))
                            .offset(x: 8, y: 0)
                        Spacer()
                    }
                    
                    // Shift time
                    HStack(spacing: .zero) {
                        Text(model.shiftTime)
                            .lineLimit(3)
                            .font(.system(size: 13))
                            .offset(x: 8, y: 0)
                        Spacer()
                    }
                }
            }
        }
    }
}

//MARK: - Model

public extension ListItem {
    /// A model representing the data for a list item.
    struct Model {
        public let title, slug, price, shiftTime: String
        public let url: URL?

        /// Initializes a new model from a `ShiftModel`.
        /// - Parameter post: The shift model containing data for the list item.
        public init(post: ShiftModel) {
            self.title = post.status
            self.price = "\(post.earnings_per_hour.currency) \(post.earnings_per_hour.amount)"
            self.slug = post.job.slug ?? ""
            self.shiftTime = post.job.project?.client?.name ?? ""
            self.url = post.job.project?.client?.links.flatMap { URL(string: $0.hero_image ?? "") }
        }

        /// A mock instance of the model for previews.
        static let mock: Self = .init(post: .mock)
    }
}

//MARK: - Previews

/// A preview provider for the `ListItem` view.
struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(model: .mock)
    }
}

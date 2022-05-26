import SwiftUI

// MARK: - FRUITS DATA MODEL

public struct Fruit: Identifiable {
  public var id = Fruit.Id()
  public let title: Fruit.Title
  public let headline: Fruit.Headline
  public let image: Fruit.Image
  public let gradientColors: Fruit.GradientColors
  public let description: Fruit.Description
  public let nutritionFacts: [Fruit.NutritionFact]

  public func getLinearGradient(
      startPoint: UnitPoint = .top,
      endPoint: UnitPoint = .bottom) -> LinearGradient {
    return LinearGradient(
      gradient: self.gradientColors.asGradient(),
      startPoint: startPoint,
      endPoint: endPoint)
  }

  // MARK: - FRUIT DOMAIN PRIMITIVES

  public typealias Id = UUID

  public struct Title: RawRepresentable, Codable, Equatable {
    public let rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
      self.init(rawValue: rawValue)
    }
  }

  public struct Headline: RawRepresentable, Codable, Equatable {
    public let rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
      self.init(rawValue: rawValue)
    }
  }

  public struct Image: RawRepresentable, Codable, Equatable {
    public let rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
      self.init(rawValue: rawValue)
    }

    public func asImage() -> SwiftUI.Image { SwiftUI.Image(self.rawValue) }
  }

  public struct GradientColors: RawRepresentable, Equatable {
    public let rawValue: [Color]

    public init(rawValue: [Color]) {
      self.rawValue = rawValue
    }

    public init(_ rawValue: [Color]) {
      self.init(rawValue: rawValue)
    }

    public func asGradient() -> Gradient { Gradient(colors: self.rawValue) }
  }

  public struct Description: RawRepresentable, Codable, Equatable {
    public let rawValue: String

    public init(rawValue: String) {
      self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
      self.init(rawValue: rawValue)
    }
  }

  public struct NutritionFact: Hashable, Equatable {
    let category: NutritionFact.Category
    let value: NutritionFact.Value

    public init(_ category: NutritionFact.Category, _ value: String) {
      self.category = category
      self.value = NutritionFact.Value(value)
    }

    public func hash(into hasher: inout Hasher) {
      hasher.combine(category)
      hasher.combine(value)
    }

    public enum Category: String, CaseIterable, Hashable {
      case energy, sugar, fat, protein, vitamins, minerals
    }

    public struct Value: RawRepresentable, Codable, Hashable, Equatable {
      public let rawValue: String

      public init(rawValue: String) {
        self.rawValue = rawValue
      }

      public init(_ rawValue: String) {
        self.init(rawValue: rawValue)
      }
    }
  }
}

import SwiftUI

extension RawRepresentable where RawValue == String {
  public func asText() -> Text { Text(self.rawValue) }
}

//
//  CountryDetailsView.swift
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

import UIKit
import SwiftUI

final class CountryDetailsView: UIStackView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init(coder: NSCoder) {
    super.init(coder: coder)
    configure()
  }

  func update(with config: CountryDetailsConfig) {
    arrangedSubviews.forEach {
      $0.removeFromSuperview()
    }

    let cells: [UIView] = [
      newCell(withTitle: NSLocalizedString("Name", comment: "Country details field title"), definition: config.name),
      newCell(withTitle: NSLocalizedString("Native", comment: "Country details field title"), definition: config.native),
      newCell(withTitle: NSLocalizedString("Phone", comment: "Country details field title"), definition: config.phone),
      newCell(withTitle: NSLocalizedString("Currency", comment: "Country details field title"), definition: config.currency),
      newCell(withTitle: NSLocalizedString("Continent", comment: "Country details field title"), definition: config.continent),
      newCell(withTitle: NSLocalizedString("Languages", comment: "Country details field title"), definition: config.languages),
      newCell(withTitle: NSLocalizedString("States", comment: "Country details field title"), definition: config.states)
    ]

    cells.forEach {
      addArrangedSubview($0)
    }
  }
}

extension CountryDetailsView {
  private func configure() {
    axis = .vertical
    distribution = .equalSpacing
    spacing = 16
  }

  private func newCell(withTitle title: String, definition: String) -> UILabel {
    let label = UILabel(frame: .zero)
    label.text = "\(title): \(definition)"
    return label
  }
}


struct CountryDetailsView_Preview: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.teal
      VStack {
        Color.clear
        Preview()
        Color.clear
      }
    }
    .ignoresSafeArea()
  }

  private struct Preview: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
      let view = CountryDetailsView(frame: .zero)
      view.update(with: PreviewUtils.uaDetails(code: "UA"))
      return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
  }
}

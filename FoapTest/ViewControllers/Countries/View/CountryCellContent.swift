//
//  CountryCellContent.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import UIKit
import SwiftUI

/// Country cell view
final class CountryCellContent: UIStackView, UIContentView {
  var configuration: UIContentConfiguration {
    didSet {
      populateViews()
    }
  }

  init(configuration: UIContentConfiguration) {
    self.configuration = configuration
    super.init(frame: .zero)
    setupLayout()
    populateViews()
  }

  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupLayout() {
    emoji = .init()
    emoji.font = .preferredFont(forTextStyle: .title1)
    addArrangedSubview(newTitleContainer())
    addArrangedSubview(emoji)

    layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 8)
    isLayoutMarginsRelativeArrangement = true
    spacing = 8
  }

  private func populateViews() {
    guard let config = configuration as? CountryCellConfiguration else {
      assertionFailure()
      return
    }

    title.text = config.name
    subtitle.text = config.code
    emoji.text = config.code.asEmojiFlag ?? ""
  }

  private func newTitleContainer() -> UIStackView {
    let container = UIStackView()
    container.isLayoutMarginsRelativeArrangement = true
    container.isBaselineRelativeArrangement = true
    container.axis = .vertical
    container.alignment = .leading
    container.distribution = .fillEqually
    title = UILabel()
    title.adjustsFontSizeToFitWidth = true
    subtitle = UILabel()
    subtitle.font = .preferredFont(forTextStyle: .caption1)
    subtitle.textColor = .secondaryLabel
    container.addArrangedSubview(title)
    container.addArrangedSubview(subtitle)
    return container
  }

  private var title: UILabel!
  private var subtitle: UILabel!
  private var emoji: UILabel!
}

// MARK: - Previews
struct CountriesMainCell_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.teal
      Preview()
        .frame(height: 66)
        .background(.white)
        .padding()
    }
    .ignoresSafeArea()
  }

  struct Preview: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
      let cell = UITableViewCell(style: .default, reuseIdentifier: "")
      cell.accessoryType = .disclosureIndicator
      let config = CountryCellConfiguration(name: "Ukraine", code: "UA")
      cell.contentConfiguration = config
      return cell
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
  }
}

//
//  DateCell.swift
//  ios-menu-app
//
//  Created by Sunny on 2023/05/19.
//

import UIKit

final class DateCell: CollectionViewCellProvidable {
    
    typealias Item = DayComponent

    // MARK: Properties - Data
    override var isSelected: Bool {
        willSet {
            self.setSelected(newValue, isIncludeInMonth: isIncludeInMonth)
        }
    }
    
    private var isIncludeInMonth: Bool = true
    
    // MARK: Properties - View
    private let numberLabel: UILabel = {
        let label =  PretendardLabel(size: 12,
                                     weight: .bold,
                                     color: .designSystem(.mainBlack),
                                     textAlignment: .center)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .designSystem(.mainBlack)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageSystemName.heartFill.image
        imageView.tintColor = .designSystem(.mainOrange)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Lifecycle
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        
        configureHierarchy()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.addBorder([.top], color: .designSystem(.separateBarGray), width: 1)
    }
    
    // MARK: Functions - Public
    func configure(with dayComponent: DayComponent) {
        
        numberLabel.text = dayComponent.number
        heartImageView.isHidden = !dayComponent.hasHeart

        if !dayComponent.isIncludeInMonth {
            numberLabel.textColor = .designSystem(.calendarDayGray)
        }

        self.isIncludeInMonth = dayComponent.isIncludeInMonth
        setSelected(isSelected, isIncludeInMonth: isIncludeInMonth)
    }
    
    private func setSelected(_ selected: Bool, isIncludeInMonth: Bool) {
        
        numberLabel.textColor = selected ? .white : .designSystem(.mainBlack)
        selectionView.isHidden = !selected
        
        if !isIncludeInMonth {
            numberLabel.textColor = selected ? .white : .designSystem(.calendarDayGray)
        }
    }
    
    // MARK: Functions - Private
    private func configureHierarchy() {
        
        contentView.addSubview(selectionView)
        contentView.addSubview(numberLabel)
        contentView.addSubview(heartImageView)
        
        let topinset: CGFloat = 15
        
        let contentHeight = contentView.frame.height
        
        let selectionDateSize = contentHeight / 3.5
        let heartImageSize = contentHeight / 6
        
        NSLayoutConstraint.activate([
                numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topinset),
                numberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                
                selectionView.centerYAnchor
                    .constraint(equalTo: numberLabel.centerYAnchor),
                selectionView.centerXAnchor
                    .constraint(equalTo: numberLabel.centerXAnchor),
                selectionView.widthAnchor.constraint(equalToConstant: selectionDateSize),
                selectionView.heightAnchor
                    .constraint(equalTo: selectionView.widthAnchor),
                
                heartImageView.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor),
                heartImageView.topAnchor.constraint(equalTo: selectionView.bottomAnchor, constant: 8),
                heartImageView.widthAnchor.constraint(equalToConstant: heartImageSize),
                heartImageView.heightAnchor.constraint(equalTo: heartImageView.widthAnchor)
        ])
        
        selectionView.layer.cornerRadius = selectionDateSize / 2
    }
}

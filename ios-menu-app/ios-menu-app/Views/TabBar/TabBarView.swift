//
//  TabBarView.swift
//  ios-menu-app
//
//  Created by Sunny on 2023/05/18.
//

import UIKit

final class TabBarView: UITabBar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureTabBar()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = sizeThatFits.height + 5
        
        return sizeThatFits
    }
    
    private func configureTabBar() {
        
        self.backgroundColor = .systemBackground
        self.tintColor = .custom(.mainOrange)
        self.unselectedItemTintColor = .custom(.tabBarGray)
        self.layer.borderColor = UIColor.custom(.tabBarSeparateGray)?.cgColor
        self.layer.borderWidth = 1
    }

}
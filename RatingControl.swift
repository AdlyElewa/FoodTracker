//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Adly Elewa on 9/9/16.
//  Copyright © 2016 Adly Elewa. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK : Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spaceing = 5
    let starCount = 5

    
    
    // MARK: Initialization
    

    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index,button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")

       
        
        for _ in 0..<5 {
            let button = UIButton()
            button.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
            button.setImage(#imageLiteral(resourceName: "filledStar"), for: .selected)
            button.setImage(#imageLiteral(resourceName: "filledStar"), for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
        func intrinsicContentSize() -> CGSize {
            let buttonSize = Int(frame.size.height)
            let width = (buttonSize * starCount) + (spaceing * (starCount - 1))
            
            return CGSize(width: width, height: buttonSize)
        }
        
    }
    
        // MARK: Button Action
        
        func ratingButtonTapped(_ button: UIButton) {
            rating = ratingButtons.index(of: button)! + 1
            updateButtonSelectionStates()
        }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
        
        
    }

}

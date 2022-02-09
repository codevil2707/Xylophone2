//
//  AddNamePopupView.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/31/22.
//

import UIKit

class AddNamePopupView: UIView{

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet var contentView: UIView!

    override init(frame: CGRect) {
        super .init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        commonInit()
    }

    fileprivate func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        Bundle.main.loadNibNamed("AddNamePopupView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }

    override var intrinsicContentSize: CGSize {
        let height = btn.frame.size.height
        let width =  btn.frame.origin.x + btn.frame.size.width
        return CGSize(width: width, height: height)
    }


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    
}

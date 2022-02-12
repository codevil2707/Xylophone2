//
//  PopupImage.swift
//  Go Music
//
//  Created by SimplyEntertaining on 2/1/22.
//

import UIKit

@IBDesignable
class PopupImageView: UIView {


      
  
 
    
       let BorderWidth: CGFloat = 2.0
       
    //MARK: - initialize view and its subview
    override init(frame: CGRect) {
      
        super.init(frame: frame)
         
      
           // Popup Title
        let popupTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height*0.3))
           popupTitle.text = "Playlist's Image"
           popupTitle.textColor = UIColor.red
           popupTitle.backgroundColor = UIColor.white
           popupTitle.layer.masksToBounds = true
           popupTitle.adjustsFontSizeToFitWidth = true
           popupTitle.clipsToBounds = true
           popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupTitle.numberOfLines = 1
           popupTitle.textAlignment = .center
           
           let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 80, height: 80)
                
        let popupCollectionView = UICollectionView(frame: CGRect(x: 0, y: self.frame.height*0.3, width: self.frame.width, height: self.frame.height*0.5), collectionViewLayout: layout)
           let nibCell = UINib(nibName: "ArrayOfImagesCollectionViewCell", bundle: nil)
           popupCollectionView.register(nibCell, forCellWithReuseIdentifier: "MyCell")
           popupCollectionView.backgroundColor = UIColor.white
          
           // Popup Button
           let popupButton = UIButton(frame: CGRect(x: 0, y: self.frame.height*0.8, width: self.frame.width, height: self.frame.height*0.2))
           popupButton.setTitle("Done", for: .normal)
           popupButton.setTitleColor(UIColor.white, for: .normal)
           popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupButton.backgroundColor = UIColor.red
           popupButton.layer.borderWidth = 2.0
           popupButton.layer.backgroundColor = CGColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
//       
          addSubview(popupTitle)
          addSubview(popupButton)
          addSubview(popupCollectionView)
           
         
    }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
}

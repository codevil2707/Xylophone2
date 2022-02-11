//
//  PopupImage.swift
//  Go Music
//
//  Created by SimplyEntertaining on 2/1/22.
//

import UIKit

@IBDesignable
class PopupImage: UIView {

    let popupView = UIView(frame: CGRect.zero)
       let popupTitle = UILabel(frame: CGRect.zero)
    let popupButton = UIButton(frame: CGRect.zero)
    var popupCollectionView:UICollectionView?
    
       let BorderWidth: CGFloat = 2.0
       
    //MARK: - initialize view and its subview
    override init(frame: CGRect) {
        super.init(frame: frame)
           // Semi-transparent background
           backgroundColor = UIColor.black.withAlphaComponent(0.3)
           
        
           
           // Popup Title
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
                
           popupCollectionView = UICollectionView(frame: CGRect(x: 0, y: 55, width: 300, height: 110), collectionViewLayout: layout)
           let nibCell = UINib(nibName: "ArrayOfImagesCollectionViewCell", bundle: nil)
           popupCollectionView?.register(nibCell, forCellWithReuseIdentifier: "MyCell")
            popupCollectionView?.backgroundColor = UIColor.white
          
           // Popup Button
           popupButton.setTitle("Done", for: .normal)
           popupButton.setTitleColor(UIColor.white, for: .normal)
           popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
           popupButton.backgroundColor = UIColor.red
           popupButton.layer.borderWidth = 2.0
           popupButton.layer.backgroundColor = CGColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
//       
           popupView.addSubview(popupTitle)
           popupView.addSubview(popupButton)
           popupView.addSubview(popupCollectionView!)
           
           // Add the popupView(box) in the PopUpWindowView (semi-transparent background)
           addSubview(popupView)
           
           //MARK: - give frame the subviews of our view
        
        
        
        //frame of image view
           
           
//           // PopupView constraints
//           popupView.translatesAutoresizingMaskIntoConstraints = false
//           NSLayoutConstraint.activate([
//               popupView.widthAnchor.constraint(equalToConstant: 304),
//               popupView.heightAnchor.constraint(equalToConstant: 209),
//               popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//               popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//               ])
//
//           // PopupTitle constraints
//           popupTitle.translatesAutoresizingMaskIntoConstraints = false
//           NSLayoutConstraint.activate([
//               popupTitle.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
//               popupTitle.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
//               popupTitle.topAnchor.constraint(equalTo: popupView.topAnchor, constant: BorderWidth),
//               popupTitle.heightAnchor.constraint(equalToConstant: 55)
//               ])
//
//            // PopupButton constraints
//           popupButton.translatesAutoresizingMaskIntoConstraints = false
//           NSLayoutConstraint.activate([
////               popupButton.heightAnchor.constraint(equalToConstant: 40),
////               popupButton.topAnchor.constraint(equalTo: popupView.topAnchor, constant: BorderWidth),
//               popupButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
//               popupButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
//               popupButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -BorderWidth)
//               ])
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
}

//
//  PopupImageViewController.swift
//  Go Music
//
//  Created by SimplyEntertaining on 2/1/22.
//

import UIKit

class PopupImageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ArrayOfImagesCollectionViewCell
        myCell.collectionImage.image = arrayOfImage[indexPath.row]
                return myCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
    }
    
    
   let popupImage = PopupImage()
    let arrayOfImage = [UIImage(named: "Music"),UIImage(named: "Bollywood"),UIImage(named: "Default"),UIImage(named: "Pop"),UIImage(named: "Romantic"),UIImage(named: "Sad-Romantic"),UIImage(named: "Sufi")]
    init(){
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        popupImage.popupCollectionView?.delegate = self
        popupImage.popupCollectionView?.dataSource = self
        popupImage.popupButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        view = popupImage
        
    }
    
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




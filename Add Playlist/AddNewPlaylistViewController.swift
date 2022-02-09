//
//  AddNewPlaylist.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/25/22.
//

import Foundation
import UIKit

//MARK: - delegate protocol for updating new playlist
protocol UpdateNewPlaylist{
    func addAlbum(_ newPlaylist:AlbumStruct)
}

//MARK: - View controller

class AddNewPlaylistViewController:UIViewController{
   //MARK: - variables
    @IBOutlet var addInPlaylistFromSonglistTableView:UITableView!
    static var delegate:UpdateNewPlaylist?
     var songList = PlayerLogic()
     var arrayOfSong = [SongInfo]()
     var selectedSong = [SongInfo]()
     var newAlbumName:String?
    var newAlbumImage:UIImage?
    let arrayOfImage = [UIImage(named: "Music"),UIImage(named: "Bollywood"),UIImage(named: "Default"),UIImage(named: "Pop"),UIImage(named: "Romantic"),UIImage(named: "Sad-Romantic"),UIImage(named: "Sufi")]
   var ishiddenPopupViewForImage = false
    var popupImage:PopupImage?
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addInPlaylistFromSonglistTableView.delegate = self
        addInPlaylistFromSonglistTableView.dataSource = self
        addInPlaylistFromSonglistTableView?.allowsMultipleSelection = true
        setNavBarOfPlaylist()
//        PopupViewController.delegate = self
       
    }
//    override func viewWillLayoutSubviews() {
//        type(of: popupImage).init(frame: CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height))
//    }
    //MARK: - setup navigation bar button Action
    
    ///on clicking add playlist name  button in add playlist
    @objc func onAdd(){
        UIView.animate(withDuration: 10, animations: {
            let popupView = PopupView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            self.modalTransitionStyle = .crossDissolve
            self.modalPresentationStyle = .overFullScreen
        
//            popupView.popupButton.addTarget(self, action: #selector(onDismiss), for: .touchUpInside)
            self.view.addSubview(popupView)
        })
    }
    
//    func animateBottomToCentre(view:UIView){
//        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
//            let newY = view.frame.maxY + (self.view.frame.height)*0.05
//            if (self.view.frame.midY == view.frame.maxY{
//                timer.invalidate()
//            }
//        })
//
//    }
    
    
    
    
    ///on clicking set image button in add playlist
    @objc func onImage(){
        if ((popupImage?.isHidden) != nil){
            popupImage?.layer.opacity = 0.0
            popupImage?.isHidden = false
        } else{
        popupImage = PopupImage(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
           modalTransitionStyle = .crossDissolve
            modalPresentationStyle = .overFullScreen
            popupImage?.popupCollectionView?.delegate = self
            popupImage?.popupCollectionView?.dataSource = self
            popupImage?.isHidden = false
            popupImage?.layer.opacity = 0.0
            popupImage?.popupButton.addTarget(self, action: #selector(onDismiss), for: .touchUpInside)
           view.addSubview(popupImage!)
            
            
            
            
        }
        fadeIn(popupImage!)
              
    }
    
    @objc func onDismiss(){
          fadeOut(popupImage!)
    
        
    }
   ///on clicking done button to set name image and song to create new playlist
    @objc func onDone(){
        if selectedSong.count == 0{
            print("Add Song")
        } else{
            if (newAlbumName == nil){onAdd()}
            if (newAlbumImage == nil){onImage()}
       let newPlaylist = AlbumStruct(albumName:newAlbumName!,albumImage:newAlbumImage!, albumPlaylist: selectedSong)
        AddNewPlaylistViewController.delegate?.addAlbum(newPlaylist)
        addInPlaylistFromSonglistTableView.reloadData()
        }
        
    }
    
    
    //MARK: - animation fadeIn/fadeOut
    func fadeIn(_ view:UIView){
        _ = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            view.layer.opacity += 0.1
            if view.layer.opacity == 1.0{
                timer.invalidate()
            }
        }
        
//        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut) {
//            view.layer.opacity = 1.0
//        } completion: { succeed in
//            if succeed {
//                print("Done ae  ji")
//            }
//        }

    }
    func fadeOut(_ view:UIView){
        _ = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            view.layer.opacity -= 0.1
            if view.layer.opacity == 0.0{
                view.isHidden = true
                timer.invalidate()
            }
        }
    }
    
  
//MARK: - setup Navigation Bar
    func setNavBarOfPlaylist(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: 50))
        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Create Playlist")
        let done = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(onDone))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd))
        let image = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(onImage))
        let leftItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onClickedCancel))
       navItem.rightBarButtonItems = [done,add,image]
        navItem.leftBarButtonItem = leftItem
        navBar.setItems([navItem], animated: false)
    }
   
    @objc func onClickedCancel(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Delegate of song list table view
extension AddNewPlaylistViewController: UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .checkmark
        selectedSong.append(arrayOfSong[indexPath.row])
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .none
            let song =  arrayOfSong[indexPath.row]
         for item in selectedSong{
            if (item == song){
                selectedSong.remove(at: selectedSong.firstIndex(of: item)!)
            }
         }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.songlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongListToAddPlaylistCell
        arrayOfSong.append(songList.songlist[indexPath.row])
      print(arrayOfSong)
        cell.songNameLabel.text = songList.songlist[indexPath.row].songName
        return cell
    }
    
}

//MARK: - delegate of updateAlbumName
extension AddNewPlaylistViewController: updateAlbumName{
func setAlbumName(_ albumName: String){
    newAlbumName = albumName
    self.reloadInputViews()
}
}

//MARK: - collection view of images
extension AddNewPlaylistViewController: UICollectionViewDelegate, UICollectionViewDataSource{
   
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrayOfImage.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
    let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ArrayOfImagesCollectionViewCell
    myCell.collectionImage.image = arrayOfImage[indexPath.row]
    myCell.overlayLayer.isHidden = true
    
            return myCell
}
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
    let myCell = collectionView.cellForItem(at: indexPath) as! ArrayOfImagesCollectionViewCell
    print("tapped")
    myCell.overlayLayer.isHidden = false
    myCell.isSelected = true
    newAlbumImage = arrayOfImage[indexPath.row]
}
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let myCell = collectionView.cellForItem(at: indexPath) as! ArrayOfImagesCollectionViewCell
        myCell.overlayLayer.isHidden = true
        myCell.isSelected = false
    }
}


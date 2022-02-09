//
//  ViewController.swift
//  Xylophone
//
//  Created by SimplyEntertaining on 12/15/21.
//
// MARK: - Imports
import UIKit


// MARK: - AudioPlayerViewController
///class AudioPlayerViewContoller inherit from UIViewController
class AudioPlayerViewController: UIViewController {
    
// MARK: - VARIABLES
    //??
    var playerLogic = PlayerLogic()
    var timer = Timer()
    // MARK: - OUTLETS
    ///display current song image
   
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var SongArtist: UILabel!
    @IBOutlet weak var songBGImageView: UIImageView!
    
    @IBOutlet weak var songImageView: UIImageView!
    
    @IBOutlet weak var songProgresSlider: UISlider!
    
    ///display Current song Title
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    ///play/pause button outlet
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    // MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
         
       
        readyToPlay()
       playPauseClicked()
        updateUI()
        playerLogic.audioPlayer.volume = volume
       
    }
    
   
    override func viewDidDisappear(_ animated: Bool) {
        playerLogic.didPause()
        volume = playerLogic.audioPlayer.volume
        print(volume)
        }
    
    
    func setNavBarOfGoMusic(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        var navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: 50))
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Go Music")
        let leftItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onClickedCancel))

       navItem.leftBarButtonItem = leftItem
        navBar.setItems([navItem], animated: true)
    }
    @objc func onClickedCancel(){
        navigationController?.dismiss(animated: true)
    }
    
   
   
    //MARK: - METHODS TO PREPARE TO PLAY SONG FROM PLAYLIST

    
    /// prepare for play song and set image and title of song on screen
    func readyToPlay(){
        playerLogic.loadCurrentSong()
       //??
    }
   
    
    func setNavBarOfPlaylist(){
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navBar = UINavigationBar(frame: CGRect(x: 0, y:startingYPos, width: view.frame.width, height: 50))
        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Go Music")
        let leftItem = UIBarButtonItem(barButtonSystemItem: .cancel , target: self, action: nil)
        
       navItem.leftBarButtonItem = leftItem
        navBar.setItems([navItem], animated: false)
    }
    func backToPlaylist(){
        navigationController?.dismiss(animated: true, completion: nil)
    }
    //MARK: - UPDATE UI
    ///updating UI of our app at every second
    func updateUI(){
        setSongImage()
        setSongTiltle()
        setSongArtist()
        setSliderDefaultValue()
        playOrPauseImageAsPerClick()
//        updateVolumeLabel()
        updateCurrentTime()
        //update volumeSlider
        volumeSlider.value = volume
        
    }
    
    ///set slider min max value
    func setSliderDefaultValue(){
        songProgresSlider.minimumValue = 0
        songProgresSlider.maximumValue = playerLogic.getDurationOfSong()
    }
    
    ///set name of song artist
    func setSongArtist(){
        SongArtist.text = playerLogic.updateSongArtistName()
    }
    
    ///function to set image
   func setSongImage(){
       songBGImageView.image = UIImage(named: playerLogic.updateSongImageName())
       songImageView.image = UIImage(named: playerLogic.updateSongImageName())
    
    }
    
    ///function to set title
    func setSongTiltle(){
        songTitleLabel.text = playerLogic.updateSongTitleName()
        
    }
//    func getSliderTimeToPlay(){
//        let sliderValue:Double = Double(songProgresSlider.value)
//        playlist.playAtSpecificTime(sliderValue)
//        print(sliderValue)
//    }
    
    ///function to update remaining time of song
    func updateRemainingTime(){
       let time = playerLogic.getRemainingTime()
        remainingTimeLabel.text =  playerLogic.convertTimeFormat(time)
        
    }

//        ///volume to update volume
//    func updateVolumeLabel(){
//        volumeLevelLabel.text = playlist.convertFloatToPercentageAsString(value: playlist.currentVolumeLevel)
//    }
//
    ///update progress of slider
    func updateProgressSlider(){
        songProgresSlider.value = playerLogic.getCurrentTimeOfSong()
    }
    
    ///set current time & update remaining time and progress slider
    @objc func getCurrentTime(){
        currentTimeLabel.text = playerLogic.convertTimeFormat(playerLogic.getCurrentTimeOfSong())
        updateRemainingTime()
        updateProgressSlider()
      
      
    }
    
    ///update get current time function every deci second
    func updateCurrentTime(){
        
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getCurrentTime), userInfo: nil, repeats: true)
       
    }
    // MARK: - ACTIONS

    
///action on play and pause button
   @IBAction func playPauseDidPressed(_ sender: UIButton) {
       playPauseClicked()
       updateUI()
       
    }
    func playPauseClicked(){
        if playerLogic.isSongPlaying{
            playerLogic.didPause()
        }
        else {
            playerLogic.didPlay()
        }
    }
    func playOrPauseImageAsPerClick(){
        if(playerLogic.isSongPlaying){
           
            playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
         }
         else {
           
             playPauseButton.setImage(UIImage(named: "play"), for: .normal)
         }
    }
    
    ///action on previous button
    @IBAction func previousButtonDidPressed(_ sender: UIButton) {
        playerLogic.didplayPreviousSong()
       updateUI()
    }
    ///action on next button
    @IBAction func nextButtonDidPressed(_ sender: UIButton) {
        playerLogic.didPlayNextSong()
        updateUI()
    }
    ///action button to increase volume
//    @IBAction func volumeUpButtonDidPressed(_ sender: UIButton) {
//        playlist.volumeUp()
//        updateVolumeLabel()
//    }
//    ///action button to  decrease volume
//    @IBAction func volumeDownButtonDidPressed(_ sender: UIButton) {
//        playlist.volumeDown()
//        updateVolumeLabel()
//    }
   
    ///action perform when pressed slider and play song if song is currently play
    @IBAction func sliderDidPressed(_ sender: UISlider) {
        playerLogic.audioPlayer.currentTime = Double(sender.value)
        if (playerLogic.isSongPlaying){
            playerLogic.didPlay()
        }
        else{
            playerLogic.didPause()
        }
        
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        volume = sender.value
        playerLogic.setVolumeInSlider()
    }
    
    
    
}


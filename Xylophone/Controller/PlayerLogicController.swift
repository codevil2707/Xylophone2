//
//  PlayerLogicController.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/24/22.
//

import Foundation
import AVFoundation
struct PlayerLogic{
   var songlist = Songlist()
var audioPlayer:AVAudioPlayer!
///index of current Song
var currentSongIndex : Int = 1
///a bool to know the status of song playing
var isSongPlaying = false
///store current value of song

var recentPlayedSong = [SongInfo]()


// MARK: - PLAYER LOGIC

mutating func loadCurrentSong(){
   
    let tempURL = getURLofSongFromMainBundle()
    let _ = loadPlayer(withNewURL: tempURL)
}
///fetch song url from main bundle and store into tempURL and return tempURL
func getURLofSongFromMainBundle()->URL{
    var tempURL:URL!
    let currentSongName = songlist.songInfo[currentSongIndex].songName
    let currentSongExt = songlist.songInfo[currentSongIndex].songExt
    tempURL = Bundle.main.url(forResource: currentSongName, withExtension: currentSongExt)
    return(tempURL)
}
                                
///create object of AVAudioplayer and return did succed as bool
mutating func loadPlayer(withNewURL:URL)->Bool{
    var didSucced:Bool = false
    audioPlayer = try! AVAudioPlayer(contentsOf: withNewURL)
    didSucced = true
    audioPlayer.prepareToPlay()
    return(didSucced)
   
}

mutating func getSongInSongHistory(){
   
//        let sInfo = SongInfo(songName: "Filhaal-2-Mohabbat", songTitle:  "Filhaal-2-Mohabbat", songArtist: "B-praak", songImage:  "Filhaal-2-Mohabbat", songExt:"mp3")
    recentPlayedSong.append(songlist.songInfo[currentSongIndex])
    print(recentPlayedSong)
    
}


func getDurationOfSong()->Float{
   
   return Float(audioPlayer.duration)
}

func getCurrentTimeOfSong()->Float{
    return Float(audioPlayer.currentTime)
}

func getRemainingTime()->Float{
  let remainingTime = audioPlayer.duration - audioPlayer.currentTime
  
    return Float(remainingTime)
}

 //MARK: - Update Functions
func updateSongImageName()->String{
    return songlist.songInfo[currentSongIndex].songImage
}


func updateSongTitleName()->String{
    return songlist.songInfo[currentSongIndex].songTitle
}

func updateSongArtistName()->String{
    return songlist.songInfo[currentSongIndex].songArtist
}
 
// MARK: - PLAY/PAUSE Button LOGIC
///It will play ths song
mutating func didPlay(){
    audioPlayer.play()
    isSongPlaying = true
    
}
///it will pause the song
 mutating func didPause(){
    audioPlayer.pause()
    isSongPlaying = false
}

///It sop the song and set current song time at 0
mutating func didStop(){
     audioPlayer.stop()
     audioPlayer.currentTime=0
     isSongPlaying = false
    
   }

///it will stop the song and play from start
mutating func didReplay(){
    didStop()
    didPlay()
}
//    func playAtSpecificTime(_ time:Double){
//        audioPlayer.play(atTime: time)
//
//    }

//MARK: - NEXT/PRE SONG METHOD

///play next song if avilable in list otherwise stop current song
mutating func didPlayNextSong(){

    if(currentSongIndex == songlist.songInfo.count-1){
        didStop()
    }
    else {
        getSongInSongHistory()
        currentSongIndex +=  1
        loadCurrentSong()
        
        if(isSongPlaying){
       didPlay()
        }
        else {
            didStop()
            
        }
    }
}

///play previous song if avilable otherwise restart current song
mutating func didplayPreviousSong(){
    if(currentSongIndex==0){
        if (isSongPlaying){
          didReplay()
        }
        else{
            didStop()
        }
    }
    else{
        getSongInSongHistory()
       currentSongIndex = currentSongIndex - 1
        loadCurrentSong()
        if(isSongPlaying){
        didPlay()
        }
        else {
            didStop()
        }
    }
}

//MARK: - VOLUME CONTROL
//   ///function for increase volume
//    mutating func volumeUp() {
//        if(currentVolumeLevel<1.0 ){
//            let value = currentVolumeLevel + 0.05
//            currentVolumeLevel = value.rounded(toPlaces: 2)
//        }
//        audioPlayer.volume = currentVolumeLevel
//
//    }
//    ///function to decrease volume
//    mutating func volumeDown() {
//
//        if (currentVolumeLevel>0.0){
////            currentVolumeLevel = currentVolumeLevel - 0.1
//            let value = currentVolumeLevel - 0.05
//            currentVolumeLevel = value.rounded(toPlaces: 2)
//        }
//            audioPlayer.volume = currentVolumeLevel
//
//        }
func setVolumeInSlider(_ currentVolume:Float){
    audioPlayer.volume = currentVolume
}
//
//MARK: - Handy Function
   ///convert volume float to string
func convertFloatToPercentageAsString(value:Float)->String{
   var percentage: Float
   percentage = (value * Float(100.0).rounded(toPlaces: 2))
   print("voume: ", Int(percentage))
   return "\(Int(percentage))"
}



func convertTimeFormat(_ time:Float)->String{
    let durationInSec = Int(time)
    var hour:Int = 00
    var  min:Int = 00
    var sec:Int = 00
    // if hour
    if(durationInSec>3600){
        hour = durationInSec/3600
        min = (durationInSec%3600)/60
        sec = (durationInSec%3600)%60
       
        return "\(hour) : \(min) : \(sec)"
    } // if has minutes
    else if(durationInSec>60){
        min = durationInSec/60
        sec = durationInSec%60
        return "\(min) : \(sec)"
    }
    else{
        sec = durationInSec
       
        return "\(min) : \(sec)"
    }
    
}



}

//MARK: - EXTENSION
extension Float {
/// Rounds the double to decimal places value
func rounded(toPlaces places:Int) -> Float {
    let divisor = pow(10.0, Float(places))
    return (self * divisor).rounded() / divisor
}
}

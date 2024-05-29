//
//  PlayerViewController.swift
//  Music Player
//
//  Created by AKANKSHA on 29/05/24.
//

import UIKit
import AVFoundation
class PlayerViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player:AVAudioPlayer?
    
    //image view
    private let albumImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //songNameLabel
    private let songNameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let albumNameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0{
            configure()
        }
    }
    
    func configure(){
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackname, ofType: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else{
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else{
                return
            }
                player.play()
        }
            
        catch{
            print("error occured")
        }
        
        //cover image
        albumImageView.frame = CGRect(x: 10, y: 10, width: holder.frame.size.width-20, height: holder.frame.size.width-20)
        
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
        
        //songname
        songNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height+10, width: holder.frame.size.width-20, height: 70)
        holder.addSubview(songNameLabel)
        
        //albumname
        albumNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height+10+70, width: holder.frame.size.width-20, height: 70)
        holder.addSubview(albumNameLabel)
        
        //artistname
        artistNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height+10+140, width: holder.frame.size.width-20, height: holder.frame.size.height-20)
        holder.addSubview(artistNameLabel)
    }
    

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player{
            player.stop()
        }
           
    }
   

}

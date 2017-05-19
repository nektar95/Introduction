//
//  LifestyleModel.swift
//  Introduction
//
//  Created by Aleksander on 5/13/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import Foundation

func loadLifestyleData() -> [[LifestyleData]] {
    var pictures = [[LifestyleData]]()
    
    let row1:[LifestyleData] = [
        LifestyleData(description: "My new beatiful profile picture from Maly Beskid Zywiecki",imageUrl: "pic1"),
        LifestyleData(description: "Hiking in the mountains is one of my favourite ways to spend holidays",imageUrl: "pic2"),
        LifestyleData(description: "Chocholowska valley in winter, here i spend New Year's eve",imageUrl: "pic3"),
        LifestyleData(description: "In my opinion best way to hiking in mountains is sleeping in tent",imageUrl: "pic4"),
        LifestyleData(description: "My first trip in moutains was in Bieszczady and I think there is no better place to see",imageUrl: "pic5"),
        LifestyleData(description: "Some sign with paths",imageUrl: "pic6"),
        LifestyleData(description: "Some photo to make more cells in collectionView",imageUrl: "pic7"),
        LifestyleData(description: "Another photo for more cells but his time from Pieniny",imageUrl: "pic8")]
    
    let row2:[LifestyleData] = [
        LifestyleData(description: "I'm irrationaly in love with city Katowice",imageUrl: "pic9"),
        LifestyleData(description: "My color biscuit dog",imageUrl: "pic10"),
        //LifestyleData(description: " ",imageUrl: "pic11"),
        LifestyleData(description: "My first trainig in open waters in road to first start in triathlon competition",imageUrl: "pic12"),
        LifestyleData(description: "Samung Knox IT Triathlon Powidz",imageUrl: "pic13"),
        LifestyleData(description: "Indoor triathlon series Beta, swimming is my worst part of triathlon",imageUrl: "pic14"),
        LifestyleData(description: "Actually I'm only 1/8 ironman right now",imageUrl: "pic15"),
        LifestyleData(description: "I'm representing team Witkowo Biega but Im not from Witkowo...",imageUrl: "pic16")]
    
    let row3:[LifestyleData] = [
        LifestyleData(description: "I reached top of Poznan University of Economics in 2 minutes runnig on stairs",imageUrl: "pic17"),
        LifestyleData(description: "Swimming without wetsuit is a little bit cold in beginning of triathlon season",imageUrl: "pic18"),
        LifestyleData(description: "Maybe I am sport freak",imageUrl: "pic19"),
        LifestyleData(description: "There is no bad weather, there is only bad outfit",imageUrl: "pic20"),
        //LifestyleData(description: " ",imageUrl: "pic21"),
        //LifestyleData(description: " ",imageUrl: "pic22"),
        //LifestyleData(description: " ",imageUrl: "pic7"),
        LifestyleData(description: "On my first run I stopped three times and took almost last place,now I am thinking to win age category",imageUrl: "pic22")]
    
    pictures.append(row1)
    pictures.append(row2)
    pictures.append(row3)
    return pictures
}


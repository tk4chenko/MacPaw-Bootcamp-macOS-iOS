//
//  MainViewModel.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import Foundation

final class MainViewModel {
    var losses: [Loss]?
    
    func loadData() {
        losses = loadEquipmentAndPersonnel()
    }
    
    func loadEquipmentAndPersonnel() -> [Loss] {
        let equipmentData: [Equipment] = JSONLoader.load(Constants.JSON.equipment)
        let personnelData: [Personnel] = JSONLoader.load(Constants.JSON.personnel)
        
        var losses: [Loss] = []
        
        var loss = Loss()
        
        for equipmentItem in equipmentData {
            
            loss.date = equipmentItem.date ?? ""
            loss.day = equipmentItem.day ?? 0
            
            loss.equipment["Aircraft"] = equipmentItem.aircraft
            loss.equipment["Anti-Aircraft Warfare"] = equipmentItem.antiAircraftWarfare
            loss.equipment["APC"] = equipmentItem.apc
            loss.equipment["Drone"] = equipmentItem.drone
            loss.equipment["Field Artillery"] = equipmentItem.fieldArtillery
            loss.equipment["Fuel Tank"] = equipmentItem.fuelTank
            loss.equipment["Helicopter"] = equipmentItem.helicopter
            loss.equipment["Military Auto"] = equipmentItem.militaryAuto
            loss.equipment["MRL"] = equipmentItem.mrl
            loss.equipment["Naval Ship"] = equipmentItem.navalShip
            loss.equipment["Tank"] = equipmentItem.tank
            
            losses.append(loss)
        }
        
        for (index, personnelItem) in personnelData.enumerated() {
            if index < losses.count {
                losses[index].personnel = personnelItem.personnel ?? 0
            }
        }
        return losses.reversed()
    }
}

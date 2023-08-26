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
        
        for equipmentItem in equipmentData {
            var loss = Loss()
            loss.date = equipmentItem.date ?? ""
            loss.day = equipmentItem.day ?? 0
            
            loss.losses["Aircraft"] = equipmentItem.aircraft
            loss.losses["Anti-Aircraft Warfare"] = equipmentItem.antiAircraftWarfare
            loss.losses["APC"] = equipmentItem.apc
            loss.losses["Drone"] = equipmentItem.drone
            loss.losses["Field Artillery"] = equipmentItem.fieldArtillery
            loss.losses["Fuel Tank"] = equipmentItem.fuelTank
            loss.losses["Helicopter"] = equipmentItem.helicopter
            loss.losses["Military Auto"] = equipmentItem.militaryAuto
            loss.losses["MRL"] = equipmentItem.mrl
            loss.losses["Naval Ship"] = equipmentItem.navalShip
            loss.losses["Tank"] = equipmentItem.tank
            
            losses.append(loss)
        }
        
        for personnelItem in personnelData {
            if let index = losses.firstIndex(where: { $0.date == personnelItem.date }) {
                losses[index].losses["Personnel"] = personnelItem.personnel
            }
        }
        return losses
    }
}

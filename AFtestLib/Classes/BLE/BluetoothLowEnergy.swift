//
//  BluetoothLowEnergy.swift
//  AFtestLib
//
//  Created by Alexandru Dranca on 16/04/2019.
//

import Foundation
import CoreBluetooth

public class BluetoothLowEnergy: NSObject {
    
    var centralManager: CBCentralManager!
    var connectedPeripheral: CBPeripheral?
    
    public override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
}

extension BluetoothLowEnergy: CBCentralManagerDelegate {

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
        case .poweredOn:
            print("central.state is .poweredOn")
            
            centralManager.scanForPeripherals(withServices: nil)
        }
    }

    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let peripheralName = peripheral.name {
            if peripheralName == "SPECIALIZED" {
                print("connecting to peripheral SPECIALIZED")
                connectedPeripheral = peripheral
                centralManager.stopScan()
                centralManager.connect(peripheral, options: nil)
            }
         }
    }
    
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("connected to peripheral \(peripheral)")
        connectedPeripheral = peripheral
        peripheral.delegate = self
        peripheral.discoverServices(nil)
        
    }
}

extension BluetoothLowEnergy: CBPeripheralDelegate {
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        
        for service in services {
            if service.uuid.uuidString == "180A" {
                peripheral.discoverCharacteristics(nil, for: service)
                
            }
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("Discovered Caracteristics for service \(service.uuid.uuidString)")
         guard let characteristics = service.characteristics else { return }
        for characteristic in characteristics {
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic)
            }
        }
        
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        print("Did update value for Peripheral \(String(describing: characteristic.value))" )
    }
}

import SwiftUI
import CoreBluetooth

// PeripheralはNSObject ただのオブジェクト delgateを実装するためにはNSObject
// viewmodelはObservableObject swiftUI独自の監視できるobject viewの方に伝えられる published




class PeripheralManager: NSObject, ObservableObject, CBPeripheralManagerDelegate {

    private var peripheralManager: CBPeripheralManager?
    //BLEで用いるサービス
    var service:CBMutableService?
    //BLEで用いるキャラクタリスティック：今回は全ての種類のCharacteristicを付与する
    //write属性のCharacteristic
    var writeCharacteristic:CBMutableCharacteristic?
    //writewithoutResponse属性のCharacteristic
    var writeWithoutResponseCharacteristic:CBMutableCharacteristic?
    //read属性のCharacteristic
    var readCharacteristic:CBMutableCharacteristic?
    //notify属性のCharacteristic
    var notifyCharacteristic:CBMutableCharacteristic?
    //indicate属性のCharacteristic
    var indicateCharacteristic:CBMutableCharacteristic?
    let BLEServiceUUID = CBUUID(string:"ACDD196E-C057-4133-AFD8-18E10378BFEB")

    // BLEで用いるキャラクタリスティック用のUUID
    let BLEWriteCharacteristicUUID = CBUUID(string:"80581675-DA7E-4555-BA81-88B4CA901EBA")
    let BLEWriteWithoutResponseCharacteristicUUID = CBUUID(string:"27F1BA36-CBF4-4FF0-AD09-58BEF0BF2F49")
    let BLEReadCharacteristicUUID = CBUUID(string:"25546FFD-2D50-4B95-9347-1A7BE04D0E83")
    let BLENotifyCharacteristicUUID = CBUUID(string:"C2CF9284-8903-4EA0-A873-FE3AB1A56FE8")
    let BLEIndicateCharacteristicUUID = CBUUID(string:"9DC18661-89A3-4F99-9021-BEAC09EFB09D")

    override init() {
        super.init()
        setupPeripheralManager()
        print("initされたよ")
    }

    func setupPeripheralManager() {
        self.peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
            print("peripheralの状態が変化したよ")
            if peripheral.state != .poweredOn {
                print("異常なStateのため処理を終了します\n")
                return;
            }
            addService()
    }

    func addService() {
        print("addServiceされたよ")
        // サービスの設定などを ViewController の addService メソッドから移植
        service = CBMutableService(type: BLEServiceUUID, primary: true)
                //キャラクタリスティックの設定(properties:属性、permissions：読み出し書込みの可否を与える)
        writeCharacteristic = CBMutableCharacteristic(type: BLEWriteCharacteristicUUID, properties: .write, value: nil, permissions: [.writeable,.readable])

        writeWithoutResponseCharacteristic = CBMutableCharacteristic(type: BLEWriteWithoutResponseCharacteristicUUID, properties: .writeWithoutResponse, value: nil, permissions: .writeable)

        //readCharacteristicは読み出した時の初期値を与えておくと、初期値固定になるのでnilにする
        //let readData = Data( [0x55])
        readCharacteristic = CBMutableCharacteristic(type: BLEReadCharacteristicUUID, properties: .read, value: nil, permissions: .readable)

        notifyCharacteristic = CBMutableCharacteristic(type: BLENotifyCharacteristicUUID, properties: .notify, value: nil, permissions: .readable)


        indicateCharacteristic = CBMutableCharacteristic(type: BLEIndicateCharacteristicUUID, properties: .indicate, value: nil, permissions: .readable)

        //サービスにキャラクタリスティックの設定
        service?.characteristics = [writeCharacteristic!,writeWithoutResponseCharacteristic!,readCharacteristic!,notifyCharacteristic!,indicateCharacteristic!]

        //ペリフェラルにサービスを追加
        peripheralManager?.add(service!)
    }

//④アドバタイズを開始
    func startAdvertising()
    {
        print("start advertise")
        //アドバタイズに乗せるService
        let serviceUUIDs = [BLEServiceUUID]
        //アドバタイズデータのセット（LocalName:BLEの設定画面で表示される名称）
        let advertisementData:[String:Any] = [CBAdvertisementDataLocalNameKey: "TEST BLE"
                                 ,CBAdvertisementDataServiceUUIDsKey:serviceUUIDs]
        //アドバタイズ開始
        self.peripheralManager?.startAdvertising(advertisementData)
    }

    // アドバタイズを停止
    func stopAdvertising()
    {
        self.peripheralManager?.stopAdvertising()
    }

    func notify(text str:String){
        var sendStr:String = str
        switch(str) {
        case "消": sendStr = "backspace"
        case "改": sendStr = "enter"
        case "決定": sendStr = "enter"
        default:
            sendStr = str
        }

        print("sendString:::   ")
        print(sendStr)
        let bytes = sendStr.utf8
        let byteArray = [UInt8](bytes)
        let notifyData = Data (byteArray)
        print("notify1")
        if let characteristic = notifyCharacteristic {
            peripheralManager?.updateValue(notifyData, for: characteristic, onSubscribedCentrals: nil)
        }
        //peripheralManager?.updateValue(notifyData, for:notifyCharacteristic!, onSubscribedCentrals: nil)
        print("notify2")
//        print("start notify")
//        let notifyData = Data( [0xAA])
//                peripheralManager?.updateValue(notifyData, for: notifyCharacteristic!, onSubscribedCentrals: nil)
    }
//    func indicate(){
//        print("start indicate")
//        let indicateData = Data( [0xBB])
//        peripheralManager?.updateValue(indicateData, for: indicateCharacteristic!, onSubscribedCentrals: nil)
//
//    }
}



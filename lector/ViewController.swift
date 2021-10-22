import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var adornoCamara: UIImageView!
    
    var video = AVCaptureVideoPreviewLayer()
    var captureSesion: AVCaptureSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configurar_lector_QR() {
        guard let dispositivo_captura = AVCaptureDevice.default(for: .video)
        else {
            Alerta_Mensaje(title: "Error del dispositivo", Mensaje: "No se pudo conectar con la camara")
            return
        }
        
        do {
            let entrada = try AVCaptureDeviceInput(device: dispositivo_captura)
            captureSesion = AVCaptureSession()
            captureSesion?.addInput(entrada)
        } catch {
            Alerta_Mensaje(title: "Error!", Mensaje: "No se pudo iniciar la camara")
            return
        }
        
        let salida = AVCaptureMetadataOutput()
        captureSesion?.addOutput(salida)
    }

}

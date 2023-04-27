import AVFoundation
import VideoToolbox

print("Supported allExportPresets", AVAssetExportSession.allExportPresets())
print("Supported availableOutputSettingsPresets", AVOutputSettingsAssistant.availableOutputSettingsPresets())

 let hasHEVCHardwareEncoder: Bool = {
    let spec: [CFString: Any]
    #if os(macOS)
        spec = [ kVTVideoEncoderSpecification_RequireHardwareAcceleratedVideoEncoder: true ]
    #else
        spec = [:]
    #endif
    var outID: CFString?
    var properties: CFDictionary?
    let result = VTCopySupportedPropertyDictionaryForEncoder(width: 1920, height: 1080, codecType: kCMVideoCodecType_HEVC, encoderSpecification: spec as CFDictionary, encoderIDOut: &outID, supportedPropertiesOut: &properties)
    if result == kVTCouldNotFindVideoEncoderErr {
        return false // no hardware HEVC encoder
    }
    return result == noErr
}()

print("hasHEVCHardwareEncoder", hasHEVCHardwareEncoder)

var systeminfo = utsname()
uname(&systeminfo)
let machine = withUnsafeBytes(of: &systeminfo.machine) {bufPtr->String in
    let data = Data(bufPtr)
    if let lastIndex = data.lastIndex(where: {$0 != 0}) {
        return String(data: data[0...lastIndex], encoding: .isoLatin1)!
    } else {
        return String(data: data, encoding: .isoLatin1)!
    }
}
print(machine)
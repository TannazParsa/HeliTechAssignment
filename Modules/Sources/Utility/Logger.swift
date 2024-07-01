//
//  Logger.swift
//
//  Created by Parsa on 6/29/24.
//

public enum LogType: String
{
    case info  = "ℹ️ Info: "
    case error = "⛔️ Error: "
    case unexpected = "💩 happens: "
}

public struct Logger
{
    public static func log(message: String = "", value: Any, logType: LogType = .info)
    {
        #if DEBUG
        let text: String = logType.rawValue + message + " \(value)"
        consoleLog(text)
        #endif
    }
    
    private static func consoleLog(_ message: String)
    {
        let consoleLog = spacing + message + spacing
        print(consoleLog)
    }
    
    private static let spacing = "\n-----------\n"
}

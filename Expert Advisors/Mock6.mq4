//+------------------------------------------------------------------+
//|                                                        Mock4.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property show_inputs

// Predefined order types for MQL4
#define OP_BUY       0
#define OP_SELL      1
#define OP_BUYLIMIT  2
#define OP_SELLLIMIT 3

// Global variables for log file paths
string csvDataLogFileName;
string tradeExecutionLogFileName;

// Global variable to track the last modification time of the CSV file
datetime lastCSVModificationTime = 0;

// Error description function
string ErrorDescription(int error_code) {
    switch (error_code) {
        case 0: return "No error";
        case 1: return "No result";
        case 2: return "Common error";
        case 3: return "Invalid trade parameters";
        case 4: return "Trade server busy";
        case 5: return "Old version of the client terminal";
        case 6: return "No connection with trade server";
        case 7: return "Account disabled";
        case 8: return "Not enough money";
        case 9: return "Price changed";
        case 10: return "Off quotes";
        case 11: return "Market closed";
        case 12: return "Trade disabled";
        case 13: return "Not enough money for margin";
        case 14: return "Too frequent requests";
        case 15: return "Orders limit reached";
        default: return "Unknown error";
    }
}

// Structure to hold trade signal details
struct Signal {
    string currencyPair;
    int direction;                // OP_BUY or OP_SELL
    double entryPrice;            // Limit order price
    double takeProfit;            // Take Profit level
    double stopLoss;              // Stop Loss level
    double trailingStopDistance;  // Trailing stop distance (in points)
    double lotSize;               // Lot size
    datetime expirationTime;      // Signal expiration time
    double maxSpread;             // Max allowed Bid/Ask spread (in points)
    string comment;               // Unique comment for signal identification
};

// Global variable to store signals
Signal signals[];

// User-defined input for CSV file path and name
input string csvFilePath = "C:\\path_to_your_csv\\signals.csv"; // Default location, change as needed

// Global variable to track the last file content hash
string lastFileHash = "";

// Function to calculate a simple hash of file contents
string CalculateFileHash() {
    int fileHandle = FileOpen(csvFilePath, FILE_CSV | FILE_READ, ',');
    if (fileHandle == INVALID_HANDLE) {
        Print("Failed to open CSV file for hash calculation: ", csvFilePath);
        return "";
    }

    string fileContents = "";
    // Read entire file contents
    while (!FileIsEnding(fileHandle)) {
        fileContents += FileReadString(fileHandle);
    }
    FileClose(fileHandle);

    // Simple hash calculation (you can replace with a more sophisticated hash if needed)
    int hash = 0;
    for (int i = 0; i < StringLen(fileContents); i++) {
        hash = hash * 31 + StringGetChar(fileContents, i);
    }

    return IntegerToString(hash);
}

// Function to check if CSV file has been modified
bool HasCSVFileChanged() {
    // Check if file exists
    if (!FileIsExist(csvFilePath)) {
        Print("CSV file does not exist: ", csvFilePath);
        return false;
    }

    // Calculate current file hash
    string currentFileHash = CalculateFileHash();

    // First time or file changed
    if (lastFileHash == "" || currentFileHash != lastFileHash) {
        lastFileHash = currentFileHash;
        return true;
    }

    return false;
}

// Initialize logging files
void InitializeLogging() {
    // Create unique log file names for each day
    string dateStr = TimeToString(TimeCurrent(), TIME_DATE);
    
    // Use StringSubstr to create date-based filenames without type conversion warnings
    csvDataLogFileName = "CSVDataLog_" + StringSubstr(dateStr, 0, 4) + "_" + StringSubstr(dateStr, 5, 2) + "_" + StringSubstr(dateStr, 8, 2) + ".csv";
    tradeExecutionLogFileName = "TradeExecutionLog_" + StringSubstr(dateStr, 0, 4) + "_" + StringSubstr(dateStr, 5, 2) + "_" + StringSubstr(dateStr, 8, 2) + ".csv";
    
    // Initialize CSV data log file with full headers and clear previous content
    int fileHandleCSV = FileOpen(csvDataLogFileName, FILE_CSV | FILE_WRITE, ',');
    if (fileHandleCSV != INVALID_HANDLE) {
        FileWrite(fileHandleCSV, 
            "Timestamp", 
            "Currency Pair", 
            "Direction", 
            "Entry Price", 
            "Take Profit", 
            "Stop Loss", 
            "Trailing Stop Distance", 
            "Lot Size", 
            "Expiration Time", 
            "Max Spread"
        );
        FileClose(fileHandleCSV);
    } else {
        Print("Failed to create CSV Data Log file: ", csvDataLogFileName);
    }

    // Initialize trade execution log file
    int fileHandleTrade = FileOpen(tradeExecutionLogFileName, FILE_CSV | FILE_WRITE, ',');
    if (fileHandleTrade != INVALID_HANDLE) {
        FileWrite(fileHandleTrade, 
            "Timestamp", 
            "Currency Pair", 
            "Direction", 
            "Entry Price", 
            "Lot Size", 
            "Take Profit", 
            "Stop Loss", 
            "Trailing Stop Distance", 
            "Result", 
            "Error Code", 
            "Order Ticket"
        );
        FileClose(fileHandleTrade);
    } else {
        Print("Failed to create Trade Execution Log file: ", tradeExecutionLogFileName);
    }
}

// Function to log CSV data
void LogCSVData(string currencyPair, int direction, double entryPrice, double takeProfit, 
                double stopLoss, double trailingStopDistance, double lotSize, 
                datetime expirationTime, double maxSpread) {
    int fileHandleLog = FileOpen(csvDataLogFileName, FILE_CSV | FILE_WRITE | FILE_READ, ',');
    if (fileHandleLog != INVALID_HANDLE) {
        FileSeek(fileHandleLog, 0, SEEK_END);
        FileWrite(fileHandleLog, 
            TimeToString(TimeCurrent()), 
            currencyPair, 
            (direction == OP_BUY) ? "BUY" : "SELL", 
            DoubleToString(entryPrice, 5), 
            DoubleToString(takeProfit, 5), 
            DoubleToString(stopLoss, 5), 
            DoubleToString(trailingStopDistance, 2), 
            DoubleToString(lotSize, 2), 
            TimeToString(expirationTime), 
            DoubleToString(maxSpread, 2)
        );
        FileClose(fileHandleLog);
    } else {
        Print("Failed to open log file: ", csvDataLogFileName);
    }
}

// Function to load signals from the CSV file
void LoadSignals() {
    int fileHandle = FileOpen(csvFilePath, FILE_CSV | FILE_READ, ',');
    if (fileHandle == INVALID_HANDLE) {
        Print("Failed to open CSV file: ", csvFilePath);
        return;
    }
    
    // Skip the header line
    FileReadString(fileHandle);
    
    // Read data line by line
    int signalIndex = 0;
    while (!FileIsEnding(fileHandle)) {
        string currencyPair = FileReadString(fileHandle);
        string directionStr = FileReadString(fileHandle);
        string entryPriceStr = FileReadString(fileHandle);
        string takeProfitStr = FileReadString(fileHandle);
        string stopLossStr = FileReadString(fileHandle);
        string trailingStopStr = FileReadString(fileHandle);
        string lotSizeStr = FileReadString(fileHandle);
        string expirationStr = FileReadString(fileHandle);
        string maxSpreadStr = FileReadString(fileHandle);

        // Skip empty lines or invalid rows
        if (StringLen(currencyPair) == 0) continue;

        // Parse and validate data
        int direction = (directionStr == "Buy") ? OP_BUY : (directionStr == "Sell" ? OP_SELL : -1);
        if (direction == -1) continue;

        double entryPrice = StringToDouble(entryPriceStr);
        double takeProfit = StringToDouble(takeProfitStr);
        double stopLoss = StringToDouble(stopLossStr);
        double trailingStopDistance = StringToDouble(trailingStopStr);
        double lotSize = StringToDouble(lotSizeStr);
        datetime expirationTime = StringToTime(expirationStr);
        double maxSpread = StringToDouble(maxSpreadStr) * Point;

        // Validate signal (e.g., spread limit)
        double spread = MarketInfo(currencyPair, MODE_ASK) - MarketInfo(currencyPair, MODE_BID);
        if (spread > maxSpread) {
            Print("Spread too high for ", currencyPair, ". Signal ignored.");
            continue;
        }

        // Log the CSV data
        LogCSVData(
            currencyPair, 
            direction, 
            entryPrice, 
            takeProfit, 
            stopLoss, 
            trailingStopDistance, 
            lotSize, 
            expirationTime, 
            maxSpread
        );

        // Resize the signal array if necessary
        if (signalIndex >= ArraySize(signals)) {
            ArrayResize(signals, signalIndex + 1);
        }

        // Fill the signal struct with data from the CSV
        signals[signalIndex].currencyPair = currencyPair;
        signals[signalIndex].direction = direction;
        signals[signalIndex].entryPrice = entryPrice;
        signals[signalIndex].takeProfit = takeProfit;
        signals[signalIndex].stopLoss = stopLoss;
        signals[signalIndex].trailingStopDistance = trailingStopDistance;
        signals[signalIndex].lotSize = lotSize;
        signals[signalIndex].expirationTime = expirationTime;
        signals[signalIndex].maxSpread = maxSpread;
        signals[signalIndex].comment = currencyPair + "_" + IntegerToString(signalIndex);

        signalIndex++;
    }

    FileClose(fileHandle);
}

// Validate signal parameters and market conditions
bool ValidateSignal(Signal &signal) {
    // Check expiration time
    if (TimeCurrent() > signal.expirationTime) {
        Print("Signal expired for ", signal.currencyPair);
        return false;
    }

    // Check if spread is within limits
    double spread = MarketInfo(signal.currencyPair, MODE_ASK) - MarketInfo(signal.currencyPair, MODE_BID);
    if (spread > signal.maxSpread) {
        Print("Spread exceeds limit for ", signal.currencyPair, ". Spread: ", spread);
        return false;
    }

    return true;
}

// Check if a trade is already placed for this signal
bool IsTradeAlreadyPlaced(Signal &signal) {
    for (int i = OrdersTotal() - 1; i >= 0; i--) {
        if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderSymbol() == signal.currencyPair && 
                OrderComment() == signal.comment) {
                return true; // Order with same symbol and comment exists
            }
        }
    }
    return false;
}

// Place an order based on signal parameters
bool PlaceOrder(Signal &signal) {
    double price = signal.entryPrice; // Correctly using entry price from signal
    double stopLoss = signal.stopLoss;
    double takeProfit = signal.takeProfit;
    double lotSize = signal.lotSize;
    int orderType = (signal.direction == OP_BUY) ? OP_BUYLIMIT : OP_SELLLIMIT;

    int ticket = OrderSend(
        signal.currencyPair, 
        orderType, 
        lotSize, 
        price, 
        3, 
        stopLoss, 
        takeProfit, 
        signal.comment, 
        0, 
        signal.expirationTime, 
        Blue
    );

    int errorCode = GetLastError();

    // Log trade execution details
    int fileHandle = FileOpen(tradeExecutionLogFileName, FILE_CSV | FILE_WRITE | FILE_READ, ',');
    if (fileHandle != INVALID_HANDLE) {
        FileSeek(fileHandle, 0, SEEK_END);
        FileWrite(fileHandle, 
            TimeToString(TimeCurrent()), 
            signal.currencyPair, 
            (signal.direction == OP_BUY) ? "BUY" : "SELL", 
            signal.entryPrice, 
            signal.lotSize, 
            signal.takeProfit, 
            signal.stopLoss, 
            "Success", 
            errorCode, 
            ticket
        );
        FileClose(fileHandle);
    } else {
        Print("Failed to open log file: ", tradeExecutionLogFileName);
    }

    if (ticket < 0) {
        Print("OrderSend failed: ", ErrorDescription(errorCode));
        return false;
    }

    return true;
}

// Execute the trade logic
bool ExecuteTrade(Signal &signal) {
    // Validate the signal
    if (!ValidateSignal(signal)) {
        Print("Validation failed for signal on ", signal.currencyPair);
        return false;
    }

    // Check existing orders to avoid duplicates
    if (IsTradeAlreadyPlaced(signal)) {
        Print("Trade already placed for ", signal.currencyPair);
        return false;
    }

    // Place the order
    return PlaceOrder(signal);
}

void ApplyTrailingStop(Signal &signal) {
    for (int i = OrdersTotal() - 1; i >= 0; i--) {
        if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES) && 
            OrderSymbol() == signal.currencyPair && 
            OrderComment() == signal.comment) {
            
            double newStop = NormalizeDouble(OrderOpenPrice() + signal.trailingStopDistance * Point, Digits);
            if (OrderStopLoss() < newStop) {
                // Check the result of OrderModify
                bool modifySuccess = OrderModify(OrderTicket(), OrderOpenPrice(), newStop, OrderTakeProfit(), 0, Blue);
                if (!modifySuccess) {
                    Print("OrderModify failed. Error: ", GetLastError());
                }
            }
        }
    }
}

// Execute trades
void ExecuteTrades() {
    // Check if CSV file has been updated
    if (HasCSVFileChanged()) {
        // Clear existing signals
        ArrayFree(signals);
        
        // Reload signals from the updated CSV
        LoadSignals();
        
        // Optional: Log that the CSV has been reloaded
        Print("CSV file updated. Reloading signals.");
    }

    // Load signals if not already loaded
    if (ArraySize(signals) == 0) {
        LoadSignals();
    }

    for (int i = 0; i < ArraySize(signals); i++) {
        Signal signal = signals[i];
        
        // Validate and execute the trade
        if (ExecuteTrade(signal)) {
            Print("Trade executed for ", signal.currencyPair);
            
            // Apply trailing stop to the executed trade
            ApplyTrailingStop(signal);
            
            // Optional: Draw trade information on chart
            ObjectCreate(0, "TradeInfo_" + signal.comment, OBJ_TEXT, 0, TimeCurrent(), signal.entryPrice);
            ObjectSetString(0, "TradeInfo_" + signal.comment, OBJPROP_TEXT, 
                StringConcatenate(
                    signal.currencyPair, " ", 
                    (signal.direction == OP_BUY) ? "BUY" : "SELL", 
                    " @ ", DoubleToString(signal.entryPrice, 5)
                )
            );
            ObjectSetInteger(0, "TradeInfo_" + signal.comment, OBJPROP_COLOR, Blue);
        } else {
            Print("Trade failed for ", signal.currencyPair);
        }
    }
}

// Initialization function
int OnInit() {
    // Initialize logging
    InitializeLogging();
    
    return(INIT_SUCCEEDED);
}

// OnTick function to monitor the strategy
void OnTick() {
    ExecuteTrades();
    for (int i = 0; i < ArraySize(signals); i++) {
        ApplyTrailingStop(signals[i]);
    }
}

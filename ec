<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Switchgear & Cable Selection Tool</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #2ecc71;
            --warning: #f39c12;
            --normal: #3498db;
            --heavy: #e74c3c;
            --gray: #95a5a6;
            --mcb: #3498db;
            --mccb: #2ecc71;
            --mpcb: #9b59b6;
            --contactor: #e67e22;
            --cable: #d35400;
            --help: #9b59b6;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 2rem;
            text-align: center;
            border-radius: 8px 8px 0 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            position: relative;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .header-text {
            flex: 1;
            text-align: left;
        }
        
        .header-buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        h1 {
            margin-bottom: 0.5rem;
            font-size: 2.2rem;
        }
        
        .subtitle {
            font-weight: 300;
            opacity: 0.9;
        }
        
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            overflow: hidden;
        }
        
        .card-header {
            background-color: var(--secondary);
            color: white;
            padding: 1rem 1.5rem;
            font-size: 1.2rem;
            font-weight: 500;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-body {
            padding: 1.5rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
        }
        
        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            transition: border 0.3s;
        }
        
        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: var(--secondary);
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }
        
        .btn {
            display: inline-block;
            background: var(--secondary);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .btn-reset {
            background: var(--gray);
            margin-left: 10px;
        }
        
        .btn-reset:hover {
            background: #7f8c8d;
        }
        
        .btn-pdf {
            background: var(--accent);
        }
        
        .btn-pdf:hover {
            background: #c0392b;
        }
        
        .btn-help {
            background: var(--help);
        }
        
        .btn-help:hover {
            background: #8e44ad;
        }
        
        .btn-upload {
            background: var(--success);
        }
        
        .btn-upload:hover {
            background: #27ae60;
        }
        
        /* Tabs styling */
        .tabs {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 1rem;
            border-bottom: 1px solid #ddd;
        }
        
        .tab-btn {
            padding: 12px 24px;
            background: #f8f9fa;
            border: none;
            border-bottom: 3px solid transparent;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .tab-btn:hover {
            background: #e9ecef;
        }
        
        .tab-btn.active {
            border-bottom: 3px solid var(--secondary);
            background: white;
        }
        
        .tab-content {
            display: none;
            padding: 1.5rem;
            background: white;
            border-radius: 0 0 8px 8px;
        }
        
        .tab-content.active {
            display: block;
        }
        
        /* Range table styling */
        .range-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        
        .range-table th {
            background-color: var(--secondary);
            color: white;
            padding: 12px;
            text-align: left;
        }
        
        .range-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        
        .range-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        .range-table tr:hover {
            background-color: #e9ecef;
        }
        
        .device-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            color: white;
            font-size: 0.8rem;
            font-weight: 500;
            margin-right: 5px;
        }
        
        .badge-mcb {
            background-color: var(--mcb);
        }
        
        .badge-mccb {
            background-color: var(--mccb);
        }
        
        .badge-mpcb {
            background-color: var(--mpcb);
        }
        
        .badge-contactor {
            background-color: var(--contactor);
        }
        
        .badge-cable {
            background-color: var(--cable);
        }
        
        .badge-help {
            background-color: var(--help);
        }
        
        .calculation-steps {
            background-color: #f8f9fa;
            border-left: 4px solid var(--secondary);
            padding: 1.5rem;
            margin: 1.5rem 0;
            border-radius: 4px;
        }
        
        .calculation-title {
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        
        .calculation-detail {
            color: #666;
            margin-bottom: 0.5rem;
        }
        
        .results {
            display: none;
            margin-top: 2rem;
        }
        
        .duty-comparison {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .duty-section {
            background: white;
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        
        .duty-normal {
            border-top: 4px solid var(--normal);
        }
        
        .duty-heavy {
            border-top: 4px solid var(--heavy);
        }
        
        .duty-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        
        .duty-icon {
            width: 24px;
            height: 24px;
            margin-right: 10px;
            border-radius: 50%;
        }
        
        .normal-icon {
            background-color: var(--normal);
        }
        
        .heavy-icon {
            background-color: var(--heavy);
        }
        
        .duty-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary);
        }
        
        .device-card {
            background: #f8f9fa;
            border-radius: 6px;
            padding: 1rem;
            margin-bottom: 1rem;
        }
        
        .device-title {
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }
        
        .device-specs {
            color: #666;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }
        
        .recommendation {
            color: var(--success);
            font-weight: 500;
        }
        
        .info-box {
            background-color: #e8f4fc;
            border-left: 4px solid var(--secondary);
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 4px;
        }
        
        /* Cable section styling */
        .cable-section {
            background: white;
            border-radius: 8px;
            padding: 1.5rem;
            margin-top: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            border-top: 4px solid var(--cable);
        }
        
        .cable-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        
        .cable-icon {
            width: 24px;
            height: 24px;
            margin-right: 10px;
            border-radius: 50%;
            background-color: var(--cable);
        }
        
        .cable-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary);
        }
        
        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            animation: fadeIn 0.3s;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: 2% auto;
            padding: 20px;
            border-radius: 8px;
            width: 100%;  
            max-width: 1100px;
            height: 90%;
            display: flex;
            flex-direction: column;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            animation: slideIn 0.3s;
        }
        
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;
            margin-bottom: 15px;
        }
        
        .modal-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
        }
        
        .close-modal {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }
        
        .close-modal:hover {
            color: var(--accent);
        }
        
        .pdf-viewer {
            flex: 1;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        
        .pdf-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        
        .pdf-action-btn {
            padding: 8px 16px;
            background: var(--secondary);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: background 0.3s;
        }
        
        .pdf-action-btn:hover {
            background: #2980b9;
        }
        
        /* Help Modal Specific Styling */
        .help-tabs {
            display: flex;
            margin-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }
        
        .help-tab {
            padding: 10px 20px;
            background: #f8f9fa;
            border: none;
            border-bottom: 3px solid transparent;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .help-tab.active {
            border-bottom: 3px solid var(--help);
            background: white;
        }
        
        .help-content {
            display: none;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 4px;
            margin-bottom: 15px;
            flex: 1;
            overflow-y: auto;
        }
        
        .help-content.active {
            display: block;
        }
        
        .datasheet-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 15px;
        }
        
        .datasheet-item {
            background: white;
            border-radius: 6px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s;
            cursor: pointer;
        }
        
        .datasheet-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .datasheet-icon {
            font-size: 2rem;
            color: var(--help);
            margin-bottom: 10px;
        }
        
        .datasheet-title {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .datasheet-desc {
            font-size: 0.9rem;
            color: #666;
        }
        
        .help-section {
            margin-bottom: 25px;
        }
        
        .help-section h3 {
            color: var(--primary);
            margin-bottom: 10px;
            padding-bottom: 5px;
            border-bottom: 1px solid #ddd;
        }
        
        .help-section p {
            margin-bottom: 10px;
            line-height: 1.5;
        }
        
        .help-section ul {
            padding-left: 20px;
            margin-bottom: 10px;
        }
        
        .help-section li {
            margin-bottom: 5px;
        }
        
        footer {
            text-align: center;
            margin-top: 3rem;
            padding: 1rem;
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
            }
            
            .header-text {
                text-align: center;
            }
            
            .header-buttons {
                justify-content: center;
                flex-wrap: wrap;
            }
            
            .grid {
                grid-template-columns: 1fr;
            }
            
            .duty-comparison {
                grid-template-columns: 1fr;
            }
            
            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
            
            .btn-reset, .btn-pdf, .btn-help {
                margin-left: 0;
            }
            
            .tabs {
                flex-direction: column;
            }
            
            .tab-btn {
                width: 100%;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            
            .tab-btn.active {
                border-bottom: 3px solid var(--secondary);
            }
            
            .modal-content {
                width: 90%;
                height: 90%;
                margin: 2.5% auto;
            }
            
            .pdf-actions {
                flex-direction: column;
            }
            
            .help-tabs {
                flex-direction: column;
            }
            
            .help-tab {
                width: 100%;
                text-align: left;
            }
            
            .datasheet-list {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="header-content">
                <div class="header-text">
                    <h1>Switchgear & Cable Selection Tool</h1>
                    <p class="subtitle">Compare Normal Duty vs Heavy Duty recommendations with cable selection</p>
                </div>
                <div class="header-buttons">
                    <button class="btn btn-pdf" id="openPdfBtn">
                        <i class="fas fa-file-pdf"></i> Cable Guide
                    </button>
                    <button class="btn btn-help" id="openHelpBtn">
                        <i class="fas fa-question-circle"></i> Help & Datasheets
                    </button>
                </div>
            </div>
        </header>
        
        <div class="card">
            <div class="card-header">Input Parameters</div>
            <div class="card-body">
                <div class="grid">
                    <div class="form-group">
                        <label for="power">Power Rating (kW)</label>
                        <input type="number" id="power" min="0" step="0.1" placeholder="Enter kW rating">
                    </div>
                    
                    <div class="form-group">
                        <label for="voltage">Voltage (V)</label>
                        <input type="number" id="voltage" min="0" step="1" value="400" placeholder="System voltage">
                    </div>
                    
                    <div class="form-group">
                        <label for="powerFactor">Power Factor</label>
                        <input type="number" id="powerFactor" min="0.1" max="1" step="0.01" value="0.8" placeholder="0.0 to 1.0">
                    </div>
                </div>
                
                <div class="grid">
                    <div class="form-group">
                        <label for="current">Full Load Current (A) - Optional</label>
                        <input type="number" id="current" min="0" step="0.1" placeholder="If known, enter directly">
                    </div>
                    
                    <div class="form-group">
                        <label for="phase">Phase Type</label>
                        <select id="phase">
                            <option value="3">3-Phase</option>
                            <option value="1">1-Phase</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="application">Application Type</label>
                        <select id="application">
                            <option value="general">General Purpose</option>
                            <option value="motor">Motor Circuit</option>
                            <option value="transformer">Transformer</option>
                            <option value="capacitor">Capacitor Bank</option>
                        </select>
                    </div>
                </div>
                
                <div class="info-box">
                    <strong>Note:</strong> The tool will calculate Full Load Current (FLC) if not provided, and apply safety factors of 1.25x for Normal Duty and 1.5x for Heavy Duty.
                </div>
                
                <div style="margin-top: 1.5rem; text-align: center;">
                    <button class="btn" id="calculateBtn">Calculate Selection</button>
                    <button class="btn btn-reset" id="resetBtn">Reset</button>
                </div>
            </div>
        </div>
        
        <div class="card results" id="resultsSection">
            <div class="card-header">Calculation Results</div>
            <div class="card-body">
                <div class="calculation-steps">
                    <div class="calculation-title">Calculation Steps</div>
                    <div class="calculation-detail" id="flcCalculation"></div>
                    <div class="calculation-detail" id="safetyFactorNote"></div>
                </div>
                
                <h2 style="margin: 1.5rem 0; text-align: center; color: var(--primary);">Duty Comparison</h2>
                
                <div class="duty-comparison">
                    <div class="duty-section duty-normal">
                        <div class="duty-header">
                            <div class="duty-icon normal-icon"></div>
                            <div class="duty-title">Normal Duty</div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">MCB (Miniature Circuit Breaker)</div>
                            <div class="device-specs" id="mcbNormalSpecs"></div>
                            <div class="recommendation" id="mcbNormalRecommendation"></div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">MCCB (Molded Case Circuit Breaker)</div>
                            <div class="device-specs" id="mccbNormalSpecs"></div>
                            <div class="recommendation" id="mccbNormalRecommendation"></div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">Contactor</div>
                            <div class="device-specs" id="contactorNormalSpecs"></div>
                            <div class="recommendation" id="contactorNormalRecommendation"></div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">MPCB (Motor Protection Circuit Breaker)</div>
                            <div class="device-specs" id="mpcbNormalSpecs"></div>
                            <div class="recommendation" id="mpcbNormalRecommendation"></div>
                        </div>
                    </div>
                    
                    <div class="duty-section duty-heavy">
                        <div class="duty-header">
                            <div class="duty-icon heavy-icon"></div>
                            <div class="duty-title">Heavy Duty</div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">MCB (Miniature Circuit Breaker)</div>
                            <div class="device-specs" id="mcbHeavySpecs"></div>
                            <div class="recommendation" id="mcbHeavyRecommendation"></div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">MCCB (Molded Case Circuit Breaker)</div>
                            <div class="device-specs" id="mccbHeavySpecs"></div>
                            <div class="recommendation" id="mccbHeavyRecommendation"></div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">Contactor</div>
                            <div class="device-specs" id="contactorHeavySpecs"></div>
                            <div class="recommendation" id="contactorHeavyRecommendation"></div>
                        </div>
                        
                        <div class="device-card">
                            <div class="device-title">MPCB (Motor Protection Circuit Breaker)</div>
                            <div class="device-specs" id="mpcbHeavySpecs"></div>
                            <div class="recommendation" id="mpcbHeavyRecommendation"></div>
                        </div>
                    </div>
                </div>
                
                <!-- Cable Selection Section -->
                <div class="cable-section">
                    <div class="cable-header">
                        <div class="cable-icon"></div>
                        <div class="cable-title">Cable Selection</div>
                    </div>
                    
                    <div class="device-card">
                        <div class="device-title">Cable Size Recommendation</div>
                        <div class="device-specs" id="cableSpecs"></div>
                        <div class="recommendation" id="cableRecommendation"></div>
                    </div>
                    
                    <div class="device-card">
                        <div class="device-title">Cable Details</div>
                        <div class="device-specs" id="cableDetails"></div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">Device & Cable Range Catalog</div>
            <div class="card-body">
                <div class="tabs">
                    <button class="tab-btn active" data-tab="mccb"><span class="device-badge badge-mccb">MCCB</span> Molded Case Circuit Breaker</button>
                    <button class="tab-btn" data-tab="mcb"><span class="device-badge badge-mcb">MCB</span> Miniature Circuit Breaker</button>
                    <button class="tab-btn" data-tab="mpcb"><span class="device-badge badge-mpcb">MPCB</span> Motor Protection Circuit Breaker</button>
                    <button class="tab-btn" data-tab="contactor"><span class="device-badge badge-contactor">Contactor</span> Contactor Ranges</button>
                    <button class="tab-btn" data-tab="cable"><span class="device-badge badge-cable">Cable</span> Cable Ranges</button>
                </div>
                
                <div class="tab-content active" id="mccb-tab">
                    <h3>MCCB Standard Ranges</h3>
                    <p>Molded Case Circuit Breakers are available in the following standard current ratings:</p>
                    <table class="range-table">
                        <thead>
                            <tr>
                                <th>Current Rating (A)</th>
                                <th>Breaking Capacity</th>
                                <th>Common Applications</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10, 16, 20, 25</td>
                                <td>10kA</td>
                                <td>Small commercial installations</td>
                            </tr>
                            <tr>
                                <td>32, 40, 50, 63</td>
                                <td>15kA</td>
                                <td>Commercial and light industrial</td>
                            </tr>
                            <tr>
                                <td>80, 100, 125</td>
                                <td>25kA</td>
                                <td>Industrial applications</td>
                            </tr>
                            <tr>
                                <td>160, 200, 250</td>
                                <td>35kA</td>
                                <td>Heavy industrial applications</td>
                            </tr>
                            <tr>
                                <td>320, 400, 500</td>
                                <td>50kA</td>
                                <td>Main distribution boards</td>
                            </tr>
                            <tr>
                                <td>630, 800, 1000</td>
                                <td>65kA</td>
                                <td>Large industrial main feeders</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="tab-content" id="mcb-tab">
                    <h3>MCB Standard Ranges</h3>
                    <p>Miniature Circuit Breakers are available in the following standard current ratings:</p>
                    <table class="range-table">
                        <thead>
                            <tr>
                                <th>Current Rating (A)</th>
                                <th>Type</th>
                                <th>Common Applications</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>6, 10</td>
                                <td>Type B</td>
                                <td>Lighting circuits, general purpose outlets</td>
                            </tr>
                            <tr>
                                <td>16, 20</td>
                                <td>Type B, C</td>
                                <td>General purpose circuits, air conditioners</td>
                            </tr>
                            <tr>
                                <td>25, 32</td>
                                <td>Type C</td>
                                <td>Kitchen appliances, water heaters</td>
                            </tr>
                            <tr>
                                <td>40, 50</td>
                                <td>Type C, D</td>
                                <td>Industrial equipment, motors</td>
                            </tr>
                            <tr>
                                <td>63</td>
                                <td>Type D</td>
                                <td>Heavy machinery, transformers</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="tab-content" id="mpcb-tab">
                    <h3>MPCB Standard Ranges</h3>
                    <p>Motor Protection Circuit Breakers are available in the following standard current ratings:</p>
                    <table class="range-table">
                        <thead>
                            <tr>
                                <th>Current Rating (A)</th>
                                <th>Motor Power (kW) at 400V</th>
                                <th>Protection Features</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>0.1 - 0.16</td>
                                <td>0.06 - 0.09</td>
                                <td>Overload, short-circuit</td>
                            </tr>
                            <tr>
                                <td>0.25 - 0.4</td>
                                <td>0.12 - 0.18</td>
                                <td>Overload, short-circuit</td>
                            </tr>
                            <tr>
                                <td>0.63 - 1.0</td>
                                <td>0.25 - 0.37</td>
                                <td>Overload, short-circuit</td>
                            </tr>
                            <tr>
                                <td>1.6 - 2.5</td>
                                <td>0.55 - 0.75</td>
                                <td>Overload, short-circuit, phase failure</td>
                            </tr>
                            <tr>
                                <td>4 - 6.3</td>
                                <td>1.1 - 1.5</td>
                                <td>Overload, short-circuit, phase failure</td>
                            </tr>
                            <tr>
                                <td>10 - 16</td>
                                <td>2.2 - 3.0</td>
                                <td>Overload, short-circuit, phase failure</td>
                            </tr>
                            <tr>
                                <td>20 - 25</td>
                                <td>4.0 - 5.5</td>
                                <td>Overload, short-circuit, phase failure</td>
                            </tr>
                            <tr>
                                <td>32 - 40</td>
                                <td>7.5 - 11</td>
                                <td>Overload, short-circuit, phase failure</td>
                            </tr>
                            <tr>
                                <td>50 - 63</td>
                                <td>15 - 18.5</td>
                                <td>Overload, short-circuit, phase failure</td>
                            </tr>
                            <tr>
                                <td>80 - 100</td>
                                <td>22 - 30</td>
                                <td>Overload, short-circuit, phase failure</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="tab-content" id="contactor-tab">
                    <h3>Contactor Standard Ranges</h3>
                    <p>Contactors are available in the following standard current ratings:</p>
                    <table class="range-table">
                        <thead>
                            <tr>
                                <th>Current Rating (A)</th>
                                <th>Coil Voltage</th>
                                <th>Common Applications</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>9 - 12</td>
                                <td>24V, 110V, 230V</td>
                                <td>Small motors, lighting control</td>
                            </tr>
                            <tr>
                                <td>18 - 25</td>
                                <td>24V, 110V, 230V, 400V</td>
                                <td>HVAC systems, small pumps</td>
                            </tr>
                            <tr>
                                <td>32 - 40</td>
                                <td>24V, 110V, 230V, 400V</td>
                                <td>Industrial motors, compressors</td>
                            </tr>
                            <tr>
                                <td>50 - 65</td>
                                <td>110V, 230V, 400V</td>
                                <td>Medium power motors, conveyors</td>
                            </tr>
                            <tr>
                                <td>80 - 95</td>
                                <td>230V, 400V</td>
                                <td>Large motors, industrial machinery</td>
                            </tr>
                            <tr>
                                <td>115 - 150</td>
                                <td>230V, 400V</td>
                                <td>Heavy machinery, large pumps</td>
                            </tr>
                            <tr>
                                <td>185 - 225</td>
                                <td>400V, 525V</td>
                                <td>High power applications</td>
                            </tr>
                            <tr>
                                <td>300 - 400</td>
                                <td>400V, 525V</td>
                                <td>Main power distribution</td>
                            </tr>
                            <tr>
                                <td>500 - 600</td>
                                <td>400V, 525V</td>
                                <td>Large industrial applications</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="tab-content" id="cable-tab">
                    <h3>Cable Standard Ranges</h3>
                    <p>Standard PVC insulated copper cables and their current carrying capacity (in air at 30°C):</p>
                    <table class="range-table">
                        <thead>
                            <tr>
                                <th>Cable Size (mm²)</th>
                                <th>Current Rating (A)</th>
                                <th>Max Power (kW) at 400V 3-phase</th>
                                <th>Typical Applications</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1.5</td>
                                <td>16</td>
                                <td>11</td>
                                <td>Lighting circuits, small appliances</td>
                            </tr>
                            <tr>
                                <td>2.5</td>
                                <td>21</td>
                                <td>14.5</td>
                                <td>Socket outlets, lighting circuits</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>28</td>
                                <td>19.5</td>
                                <td>Cooker circuits, immersion heaters</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>36</td>
                                <td>25</td>
                                <td>Shower circuits, small motors</td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>46</td>
                                <td>32</td>
                                <td>Small distribution circuits</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>61</td>
                                <td>42</td>
                                <td>Sub-main circuits, medium motors</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>80</td>
                                <td>55</td>
                                <td>Distribution boards, large motors</td>
                            </tr>
                            <tr>
                                <td>35</td>
                                <td>99</td>
                                <td>68</td>
                                <td>Main supply cables</td>
                            </tr>
                            <tr>
                                <td>50</td>
                                <td>121</td>
                                <td>84</td>
                                <td>Main supply cables</td>
                            </tr>
                            <tr>
                                <td>70</td>
                                <td>155</td>
                                <td>107</td>
                                <td>Heavy industrial applications</td>
                            </tr>
                            <tr>
                                <td>95</td>
                                <td>188</td>
                                <td>130</td>
                                <td>Heavy industrial applications</td>
                            </tr>
                            <tr>
                                <td>120</td>
                                <td>218</td>
                                <td>151</td>
                                <td>Large industrial installations</td>
                            </tr>
                            <tr>
                                <td>150</td>
                                <td>250</td>
                                <td>173</td>
                                <td>Large industrial installations</td>
                            </tr>
                            <tr>
                                <td>185</td>
                                <td>285</td>
                                <td>197</td>
                                <td>High power distribution</td>
                            </tr>
                            <tr>
                                <td>240</td>
                                <td>340</td>
                                <td>235</td>
                                <td>High power distribution</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Other tab contents remain the same -->
                <!-- ... (content for other tabs) ... -->
                
            </div>
        </div>
        
        <!-- PDF Modal -->
        <div id="pdfModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">Cable Selection Guide</h2>
                    <span class="close-modal">&times;</span>
                </div>
                <div class="pdfModal">
                    <button class="pdfModal active" data-help="datasheets">Datasheets</button>
                    <button class="help-tab" data-help="tutorial">How to Use</button>
                    <button class="help-tab" data-help="faq">FAQ</button>
                    <button class="help-tab" data-help="resources">Additional Resources</button>
                </div>
                
                
                <iframe class="pdf-viewer" id="pdfViewer" src="https://munters-my.sharepoint.com/:b:/r/personal/vivek_mishra_munters_com/Documents/01_Work/02_Cable%20giude/cable%20guide.pdf?csf=1&web=1&e=JCSwYm"></iframe>
                
                <div class="pdf-actions">
                    <button class="pdf-action-btn" id="downloadPdf">
                        <i class="fas fa-download"></i> Download PDF
                    </button>
                    <button class="pdf-action-btn" id="sharePdf">
                        <i class="fas fa-share-alt"></i> Share PDF
                    </button>
                    <button class="pdf-action-btn" id="printPdf">
                        <i class="fas fa-print"></i> Print PDF
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Help Modal -->
        <div id="helpModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title"><i class="fas fa-question-circle"></i> Help & Datasheets</h2>
                    <span class="close-modal">&times;</span>
                </div>
                
                <div class="help-tabs">
                    <button class="help-tab active" data-help="datasheets">Datasheets</button>
                    <button class="help-tab" data-help="tutorial">How to Use</button>
                    <button class="help-tab" data-help="faq">FAQ</button>
                    <button class="help-tab" data-help="resources">Additional Resources</button>
                </div>
                
                <div class="help-content active" id="datasheets-help">
                    <h3>Product Datasheets</h3>
                    <p>Browse and download datasheets for various electrical components:</p>
                    

                    
                    <div class="datasheet-list">
                        <div class="datasheet-item" data-pdf="https://munters-my.sharepoint.com/:b:/r/personal/vivek_mishra_munters_com/Documents/AHU%20DATASHEETS/L%26T%20MCB_DB.pdf?csf=1&web=1&e=7TSz4j">
                            <div class="datasheet-icon">
                                <i class="fas fa-charging-station"></i>
                            </div>
                            <div class="datasheet-title">MCB Datasheets L&T</div>
                            <div class="datasheet-desc">Miniature Circuit Breakers technical specifications</div>
                        </div>
                        <script>
                            document.querySelectorAll('.datasheet-item').forEach(item => {
                                item.addEventListener('click', () => {
                                    const pdfUrl = item.getAttribute('data-pdf');
                                    if (pdfUrl) {
                                        window.open(pdfUrl, '_blank'); // open in new tab
                                    }
                                });
                            });
                            </script>
                        <div class="datasheet-item" data-pdf="https://munters-my.sharepoint.com/:b:/r/personal/vivek_mishra_munters_com/Documents/AHU%20DATASHEETS/MCB%20refer%20c%26s%20rating%20motor.pdf?csf=1&web=1&e=yONfkR">
                            <div class="datasheet-icon">
                                <i class="fas fa-bolt"></i>
                            </div>
                            <div class="datasheet-title">MCB Datasheets C&S</div>
                            <div class="datasheet-desc">Miniature Circuit Breakers technical specifications</div>
                        </div>
                        <script>
                            document.querySelectorAll('.datasheet-item').forEach(item => {
                                item.addEventListener('click', () => {
                                    const pdfUrl = item.getAttribute('data-pdf');
                                    if (pdfUrl) {
                                        window.open(pdfUrl, '_blank'); // open in new tab
                                    }
                                });
                            });
                            </script>
                        
                        <div class="datasheet-item" data-pdf="mccb-datasheet.pdf">
                            <div class="datasheet-icon">
                                <i class="fas fa-cog"></i>
                            </div>
                            <div class="datasheet-title">MCCB Datasheets</div>
                            <div class="datasheet-desc">Molded Case Circuit Breakers technical data</div>
                        </div>
                        
                        <div class="datasheet-item" data-pdf="contactor-datasheet.pdf">
                            <div class="datasheet-icon">
                                <i class="fas fa-exchange-alt"></i>
                            </div>
                            <div class="datasheet-title">Contactor Datasheets</div>
                            <div class="datasheet-desc">Contactors and relays specifications</div>
                        </div>
                        
                        <div class="datasheet-item" data-pdf="mpcb-datasheet.pdf">
                            <div class="datasheet-icon">
                                <i class="fas fa-motorcycle"></i>
                            </div>
                            <div class="datasheet-title">MPCB Datasheets</div>
                            <div class="datasheet-desc">Motor Protection Circuit Breakers technical info</div>
                        </div>
                        
                        <div class="datasheet-item" data-pdf="cable-datasheet.pdf">
                            <div class="datasheet-icon">
                                <i class="fas fa-plug"></i>
                            </div>
                            <div class="datasheet-title">Cable Datasheets</div>
                            <div class="datasheet-desc">Cable specifications and current ratings</div>
                        </div>
                        
                        <div class="datasheet-item" data-pdf="selection-guide.pdf">
                            <div class="datasheet-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <div class="datasheet-title">Selection Guide</div>
                            <div class="datasheet-desc">Comprehensive component selection manual</div>
                        </div>

                        <div class="datasheet-item" data-pdf="https://munters-my.sharepoint.com/:f:/r/personal/vivek_mishra_munters_com/Documents/AHU%20DATASHEETS?csf=1&web=1&e=BQuP2U">
                            <div class="datasheet-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <div class="datasheet-title">CE Certfication</div>
                            <div class="datasheet-desc">Comprehensive component selection manual</div>
                        </div>
                        <div class="datasheet-item" data-pdf="AHU datasheets.pdf">
                            <div class="datasheet-icon">
                                <i class="fas fa-book"></i>
                            </div>
                            <div class="datasheet-title">AHU datasheets</div>
                            <div class="datasheet-desc">Comprehensive component selection manual</div>
                        </div>
                        <div class="datasheet-item" data-pdf="https://munters-my.sharepoint.com/:f:/r/personal/vivek_mishra_munters_com/Documents/AHU%20DATASHEETS?csf=1&web=1&e=BQuP2U">
                            <div class="datasheet-icon">
                                <i class="fas fa-bolt"></i>
                            </div>
                            <div class="datasheet-title">AHU datasheet</div>
                            <div class="datasheet-desc">Miniature Circuit Breakers technical specifications</div>
                        </div>
                        <script>
                            document.querySelectorAll('.datasheet-item').forEach(item => {
                                item.addEventListener('click', () => {
                                    const pdfUrl = item.getAttribute('data-pdf');
                                    if (pdfUrl) {
                                        window.open(pdfUrl, '_blank'); // open in new tab
                                    }
                                });
                            });
                            </script>
                        <div class="datasheet-item" data-pdf="https://munters-my.sharepoint.com/:b:/r/personal/vivek_mishra_munters_com/Documents/01_Work/Ce%20Certification%20folder/Ce%20Certification%20folder/European%20Standard/European%20standard.pdf?csf=1&web=1&e=KCRhAk">
                            <div class="datasheet-icon">
                                <i class="fas fa-bolt"></i>
                            </div>
                            <div class="datasheet-title">European standard</div>
                            <div class="datasheet-desc">Miniature Circuit Breakers technical specifications</div>
                        </div>
                        <script>
                            document.querySelectorAll('.datasheet-item').forEach(item => {
                                item.addEventListener('click', () => {
                                    const pdfUrl = item.getAttribute('data-pdf');
                                    if (pdfUrl) {
                                        window.open(pdfUrl, '_blank'); // open in new tab
                                    }
                                });
                            });
                            </script>
                    </div>
                </div>
                
                <div class="help-content" id="tutorial-help">
                    <h3>How to Use This Tool</h3>
                    
                    <div class="help-section">
                        <h4>Step 1: Enter Electrical Parameters</h4>
                        <p>Provide the basic electrical parameters for your system:</p>
                        <ul>
                            <li><strong>Power Rating (kW):</strong> The power consumption of your load</li>
                            <li><strong>Voltage (V):</strong> System voltage (default is 400V for 3-phase systems)</li>
                            <li><strong>Power Factor:</strong> The power factor of your load (default is 0.8)</li>
                            <li><strong>Full Load Current (Optional):</strong> If known, enter directly</li>
                            <li><strong>Phase Type:</strong> Select between 1-phase or 3-phase systems</li>
                            <li><strong>Application Type:</strong> Choose the appropriate application for your load</li>
                        </ul>
                    </div>
                    
                    <div class="help-section">
                        <h4>Step 2: Calculate Selection</h4>
                        <p>Click the "Calculate Selection" button to generate recommendations for:</p>
                        <ul>
                            <li>MCB (Miniature Circuit Breaker)</li>
                            <li>MCCB (Molded Case Circuit Breaker)</li>
                            <li>Contactor</li>
                            <li>MPCB (Motor Protection Circuit Breaker)</li>
                            <li>Appropriate cable size</li>
                        </ul>
                    </div>
                    
                    <div class="help-section">
                        <h4>Step 3: Review Results</h4>
                        <p>The tool provides recommendations for both Normal Duty and Heavy Duty applications:</p>
                        <ul>
                            <li><strong>Normal Duty:</strong> Uses a 1.25x safety factor for general applications</li>
                            <li><strong>Heavy Duty:</strong> Uses a 1.5x safety factor for demanding applications</li>
                        </ul>
                    </div>
                </div>
                
                <div class="help-content" id="faq-help">
                    <h3>Frequently Asked Questions</h3>
                    
                    <div class="help-section">
                        <h4>What safety factors does the tool use?</h4>
                        <p>The tool applies different safety factors based on the application type:</p>
                        <ul>
                            <li><strong>Normal Duty:</strong> 1.25x Full Load Current</li>
                            <li><strong>Heavy Duty:</strong> 1.5x Full Load Current</li>
                            <li><strong>Motor Circuits:</strong> Additional 1.2x factor for starting current</li>
                            <li><strong>Transformer Protection:</strong> Additional 1.1x factor for inrush current</li>
                            <li><strong>Capacitor Banks:</strong> Additional 1.3x factor for switching currents</li>
                        </ul>
                    </div>
                    
                    <div class="help-section">
                        <h4>How is cable size determined?</h4>
                        <p>Cable sizes are selected based on:</p>
                        <ul>
                            <li>Current carrying capacity of standard cable sizes</li>
                            <li>PVC insulated copper cables in air at 30°C ambient temperature</li>
                            <li>Next standard size above the calculated current requirement</li>
                            <li>Consideration for both Normal and Heavy Duty applications</li>
                        </ul>
                    </div>
                    
                    <div class="help-section">
                        <h4>Can I use this tool for DC systems?</h4>
                        <p>This tool is specifically designed for AC systems. For DC applications, different calculations and safety factors apply. Please consult appropriate DC electrical engineering references.</p>
                    </div>
                </div>
                
                <div class="help-content" id="resources-help">
                    <h3>Additional Resources</h3>
                    
                    <div class="help-section">
                        <h4>Standards and References</h4>
                        <ul>
                            <li>IEC 60947 - Low-voltage switchgear and controlgear</li>
                            <li>IEC 60898 - Circuit-breakers for overcurrent protection</li>
                            <li>IEC 60204 - Safety of machinery - Electrical equipment of machines</li>
                            <li>National Electrical Code (NEC) / IEC 60364 - Electrical installations</li>
                        </ul>
                    </div>
                    
                    <div class="help-section">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#" target="_blank">Electrical Engineering Portal</a></li>
                            <li><a href="#" target="_blank">Switchgear Manufacturer Specifications</a></li>
                            <li><a href="#" target="_blank">Cable Selection Guidelines</a></li>
                            <li><a href="#" target="_blank">Motor Protection Principles</a></li>
                        </ul>
                    </div>
                    
                    <div class="help-section">
                        <h4>Contact Support</h4>
                        <p>If you need further assistance or have specific questions about your application:</p>
                        <p>Email: vivek.mishra@munters.com<br>
                        Phone: +91 9654092129</p>
                    </div>
                </div>
            </div>
        </div>
        
        <footer>
            <p>Disclaimer: This tool provides recommendations based on standard electrical formulas. Always consult relevant standards and a qualified electrical engineer for critical applications.</p>
            <p>© 2025 R&D ENGINEERING TOOL</p>
        </footer>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const calculateBtn = document.getElementById('calculateBtn');
            const resetBtn = document.getElementById('resetBtn');
            const resultsSection = document.getElementById('resultsSection');
            const tabBtns = document.querySelectorAll('.tab-btn');
            const tabContents = document.querySelectorAll('.tab-content');
            const openPdfBtn = document.getElementById('openPdfBtn');
            const openHelpBtn = document.getElementById('openHelpBtn');
            const pdfModal = document.getElementById('pdfModal');
            const helpModal = document.getElementById('helpModal');
            const closeModals = document.querySelectorAll('.close-modal');
            const pdfViewer = document.getElementById('pdfViewer');
            const downloadPdfBtn = document.getElementById('downloadPdf');
            const sharePdfBtn = document.getElementById('sharePdf');
            const printPdfBtn = document.getElementById('printPdf');
            
            // Help modal elements
            const helpTabs = document.querySelectorAll('.help-tab');
            const helpContents = document.querySelectorAll('.help-content');
            const datasheetItems = document.querySelectorAll('.datasheet-item');
            
            calculateBtn.addEventListener('click', calculateDevices);
            resetBtn.addEventListener('click', resetForm);
            
            // Modal functionality
            openPdfBtn.addEventListener('click', () => openModal(pdfModal));
            openHelpBtn.addEventListener('click', () => openModal(helpModal));
            
            closeModals.forEach(closeBtn => {
                closeBtn.addEventListener('click', function() {
                    const modal = this.closest('.modal');
                    closeModal(modal);
                });
            });
            
            // Close modal when clicking outside the content
            window.addEventListener('click', function(event) {
                if (event.target.classList.contains('modal')) {
                    closeModal(event.target);
                }
            });
            
            // Help tab functionality
            helpTabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    const helpId = tab.getAttribute('data-help');
                    
                    // Deactivate all tabs and contents
                    helpTabs.forEach(t => t.classList.remove('active'));
                    helpContents.forEach(c => c.classList.remove('active'));
                    
                    // Activate clicked tab and content
                    tab.classList.add('active');
                    document.getElementById(`${helpId}-help`).classList.add('active');
                });
            });
            
            // Datasheet items functionality
            datasheetItems.forEach(item => {
                item.addEventListener('click', function() {
                    const pdfName = this.getAttribute('data-pdf');
                    // In a real application, this would load the actual PDF
                    alert(`This would open the ${pdfName} datasheet. In a real application, the PDF would be loaded.`);
                });
            });
            
            // PDF action buttons
            downloadPdfBtn.addEventListener('click', downloadPdf);
            sharePdfBtn.addEventListener('click', sharePdf);
            printPdfBtn.addEventListener('click', printPdf);
            
            // Tab functionality
            tabBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    const tabId = btn.getAttribute('data-tab');
                    
                    // Deactivate all tabs
                    tabBtns.forEach(b => b.classList.remove('active'));
                    tabContents.forEach(c => c.classList.remove('active'));
                    
                    // Activate clicked tab
                    btn.classList.add('active');
                    document.getElementById(`${tabId}-tab`).classList.add('active');
                });
            });
            
            function openModal(modal) {
                modal.style.display = 'block';
                document.body.style.overflow = 'hidden'; // Prevent scrolling
            }
            
            function closeModal(modal) {
                modal.style.display = 'none';
                if (modal === pdfModal) {
                    pdfViewer.src = 'about:blank'; // Clear the iframe
                }
                document.body.style.overflow = 'auto'; // Restore scrolling
            }
            
            function downloadPdf() {
                const currentSrc = pdfViewer.src;
                if (currentSrc && currentSrc !== 'about:blank') {
                    // Create a temporary link to download the PDF
                    const link = document.createElement('a');
                    link.href = currentSrc;
                    link.download = 'cable-selection-guide.pdf';
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                } else {
                    alert('No PDF loaded to download');
                }
            }
            
            function sharePdf() {
                const currentSrc = pdfViewer.src;
                if (currentSrc && currentSrc !== 'about:blank') {
                    if (navigator.share) {
                        navigator.share({
                            title: 'Cable Selection Guide',
                            text: 'Check out this cable selection guide for electrical engineering.',
                            url: currentSrc
                        })
                        .catch(error => console.log('Error sharing:', error));
                    } else {
                        // Fallback for browsers that don't support the Web Share API
                        alert('Share this PDF: ' + currentSrc);
                    }
                } else {
                    alert('No PDF loaded to share');
                }
            }
            
            function printPdf() {
                const currentSrc = pdfViewer.src;
                if (currentSrc && currentSrc !== 'about:blank') {
                    const pdfWindow = window.open(currentSrc, '_blank');
                    pdfWindow.onload = function() {
                        pdfWindow.print();
                    };
                } else {
                    alert('No PDF loaded to print');
                }
            }
            
            function calculateDevices() {
                // Get input values
                const power = parseFloat(document.getElementById('power').value);
                const voltage = parseFloat(document.getElementById('voltage').value);
                const powerFactor = parseFloat(document.getElementById('powerFactor').value);
                const currentInput = parseFloat(document.getElementById('current').value);
                const phase = document.getElementById('phase').value;
                const application = document.getElementById('application').value;
                
                // Validate inputs
                if ((isNaN(power) || power <= 0) && isNaN(currentInput)) {
                    alert('Please enter a valid power rating or full load current');
                    return;
                }
                
                if (isNaN(voltage) || voltage <= 0) {
                    alert('Please enter a valid voltage');
                    return;
                }
                
                if (isNaN(powerFactor) || powerFactor < 0.1 || powerFactor > 1) {
                    alert('Please enter a valid power factor between 0.1 and 1.0');
                    return;
                }
                
                // Calculate full load current if not provided
                let fullLoadCurrent;
                let flcFormula = '';
                
                if (!isNaN(currentInput) && currentInput > 0) {
                    fullLoadCurrent = currentInput;
                    flcFormula = `Using provided Full Load Current: ${fullLoadCurrent.toFixed(2)}A`;
                } else {
                    // I = P / (V * PF * √3) for 3-phase, I = P / (V * PF) for 1-phase
                    if (phase === '3') {
                        fullLoadCurrent = power * 1000 / (voltage * powerFactor * Math.sqrt(3));
                        flcFormula = `FLC = Power / (Voltage × PF × √3) = ${power} × 1000 / (${voltage} × ${powerFactor} × 1.732) = ${fullLoadCurrent.toFixed(2)}A`;
                    } else {
                        fullLoadCurrent = power * 1000 / (voltage * powerFactor);
                        flcFormula = `FLC = Power / (Voltage × PF) = ${power} × 1000 / (${voltage} × ${powerFactor}) = ${fullLoadCurrent.toFixed(2)}A`;
                    }
                }
                
                // Apply application-specific factors
                let applicationFactor = 1.0;
                let applicationNote = '';
                
                switch(application) {
                    case 'motor':
                        applicationFactor = 1.2; // Additional factor for motor starting current
                        applicationNote = ' (including motor starting current factor)';
                        break;
                    case 'transformer':
                        applicationFactor = 1.1; // Small factor for transformer inrush
                        applicationNote = ' (including transformer inrush factor)';
                        break;
                    case 'capacitor':
                        applicationFactor = 1.3; // Factor for capacitor switching
                        applicationNote = ' (including capacitor switching factor)';
                        break;
                    default:
                        applicationFactor = 1.0;
                        applicationNote = '';
                }
                
                const adjustedFLC = fullLoadCurrent * applicationFactor;
                
                // Define safety factors for different duty types
                const normalDutyFactor = 1.25;
                const heavyDutyFactor = 1.5;
                
                const ratedCurrentNormal = adjustedFLC * normalDutyFactor;
                const ratedCurrentHeavy = adjustedFLC * heavyDutyFactor;
                
                // Update calculation steps
                document.getElementById('flcCalculation').textContent = flcFormula + applicationNote;
                document.getElementById('safetyFactorNote').innerHTML = 
                    `Adjusted FLC: ${adjustedFLC.toFixed(2)}A<br>
                     Normal Duty: ${adjustedFLC.toFixed(2)} × ${normalDutyFactor} = ${ratedCurrentNormal.toFixed(2)}A<br>
                     Heavy Duty: ${adjustedFLC.toFixed(2)} × ${heavyDutyFactor} = ${ratedCurrentHeavy.toFixed(2)}A`;
                
                // Calculate device ratings for both duty types
                const mcbNormal = calculateStandardRating(ratedCurrentNormal, [6, 10, 16, 20, 25, 32, 40, 50, 63]);
                const mcbHeavy = calculateStandardRating(ratedCurrentHeavy, [6, 10, 16, 20, 25, 32, 40, 50, 63]);
                
                const mccbNormal = calculateStandardRating(ratedCurrentNormal, [10, 16, 20, 25, 32, 40, 50, 63, 80, 100, 125, 160, 200, 250, 320, 400, 630, 800, 1000]);
                const mccbHeavy = calculateStandardRating(ratedCurrentHeavy, [10, 16, 20, 25, 32, 40, 50, 63, 80, 100, 125, 160, 200, 250, 320, 400, 630, 800, 1000]);
                
                const contactorNormal = calculateStandardRating(adjustedFLC, [9, 12, 18, 25, 32, 40, 50, 65, 80, 95, 115, 150, 185, 225, 300, 400, 500, 600, 800]);
                const contactorHeavy = calculateStandardRating(adjustedFLC * 1.2, [9, 12, 18, 25, 32, 40, 50, 65, 80, 95, 115, 150, 185, 225, 300, 400, 500, 600, 800]);
                
                const mpcbNormal = calculateStandardRating(ratedCurrentNormal, [0.1, 0.16, 0.25, 0.4, 0.63, 1, 1.6, 2.5, 4, 6.3, 10, 16, 20, 25, 32, 40, 50, 63, 80, 100, 125, 160]);
                const mpcbHeavy = calculateStandardRating(ratedCurrentHeavy, [0.1, 0.16, 0.25, 0.4, 0.63, 1, 1.6, 2.5, 4, 6.3, 10, 16, 20, 25, 32, 40, 50, 63, 80, 100, 125, 160]);
                
                // Calculate cable size
                const cableSizeNormal = calculateCableSize(ratedCurrentNormal);
                const cableSizeHeavy = calculateCableSize(ratedCurrentHeavy);
                
                // Update the UI with recommendations for Normal Duty
                document.getElementById('mcbNormalSpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A | Rated: ${ratedCurrentNormal.toFixed(2)}A`;
                document.getElementById('mcbNormalRecommendation').textContent = `Recommended: ${mcbNormal}A MCB`;
                
                document.getElementById('mccbNormalSpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A | Rated: ${ratedCurrentNormal.toFixed(2)}A`;
                document.getElementById('mccbNormalRecommendation').textContent = `Recommended: ${mccbNormal}A MCCB`;
                
                document.getElementById('contactorNormalSpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A`;
                document.getElementById('contactorNormalRecommendation').textContent = `Recommended: ${contactorNormal}A Contactor`;
                
                document.getElementById('mpcbNormalSpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A | Rated: ${ratedCurrentNormal.toFixed(2)}A`;
                document.getElementById('mpcbNormalRecommendation').textContent = `Recommended: ${mpcbNormal}A MPCB`;
                
                // Update the UI with recommendations for Heavy Duty
                document.getElementById('mcbHeavySpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A | Rated: ${ratedCurrentHeavy.toFixed(2)}A`;
                document.getElementById('mcbHeavyRecommendation').textContent = `Recommended: ${mcbHeavy}A MCB`;
                
                document.getElementById('mccbHeavySpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A | Rated: ${ratedCurrentHeavy.toFixed(2)}A`;
                document.getElementById('mccbHeavyRecommendation').textContent = `Recommended: ${mccbHeavy}A MCCB`;
                
                document.getElementById('contactorHeavySpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A`;
                document.getElementById('contactorHeavyRecommendation').textContent = `Recommended: ${contactorHeavy}A Contactor`;
                
                document.getElementById('mpcbHeavySpecs').textContent = `FLC: ${adjustedFLC.toFixed(2)}A | Rated: ${ratedCurrentHeavy.toFixed(2)}A`;
                document.getElementById('mpcbHeavyRecommendation').textContent = `Recommended: ${mpcbHeavy}A MPCB`;
                
                // Update cable recommendations
                document.getElementById('cableSpecs').textContent = `Normal Duty: ${ratedCurrentNormal.toFixed(2)}A | Heavy Duty: ${ratedCurrentHeavy.toFixed(2)}A`;
                document.getElementById('cableRecommendation').innerHTML = 
                    `Normal Duty: ${cableSizeNormal.size}mm² Cable | Heavy Duty: ${cableSizeHeavy.size}mm² Cable`;
                
                document.getElementById('cableDetails').innerHTML = 
                    `Normal Duty: ${cableSizeNormal.current}A capacity | Heavy Duty: ${cableSizeHeavy.current}A capacity`;
                
                // Show results section
                resultsSection.style.display = 'block';
                
                // Scroll to results
                resultsSection.scrollIntoView({ behavior: 'smooth' });
            }
            
            function calculateStandardRating(current, standardValues) {
                // Find the next highest standard rating
                for (let i = 0; i < standardValues.length; i++) {
                    if (standardValues[i] >= current) {
                        return standardValues[i];
                    }
                }
                // If current exceeds all standard values, return the highest available
                return standardValues[standardValues.length - 1];
            }
            
            function calculateCableSize(current) {
                // Standard cable sizes and their current ratings (PVC insulated, in air at 30°C)
                const cableSizes = [
                    { size: 1.5, current: 16 },
                    { size: 2.5, current: 21 },
                    { size: 4, current: 28 },
                    { size: 6, current: 36 },
                    { size: 10, current: 46 },
                    { size: 16, current: 61 },
                    { size: 25, current: 80 },
                    { size: 35, current: 99 },
                    { size: 50, current: 121 },
                    { size: 70, current: 155 },
                    { size: 95, current: 188 },
                    { size: 120, current: 218 },
                    { size: 150, current: 250 },
                    { size: 185, current: 285 },
                    { size: 240, current: 340 }
                ];
                
                // Find the appropriate cable size
                for (let i = 0; i < cableSizes.length; i++) {
                    if (cableSizes[i].current >= current) {
                        return cableSizes[i];
                    }
                }
                
                // If current exceeds all standard cable ratings, return the largest size
                return cableSizes[cableSizes.length - 1];
            }
            
            function resetForm() {
                document.getElementById('power').value = '';
                document.getElementById('voltage').value = '400';
                document.getElementById('powerFactor').value = '0.8';
                document.getElementById('current').value = '';
                document.getElementById('phase').value = '3';
                document.getElementById('application').value = 'general';
                
                resultsSection.style.display = 'none';
            }
        });
    </script>
</body>
</html>

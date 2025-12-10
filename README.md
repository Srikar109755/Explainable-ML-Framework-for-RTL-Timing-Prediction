# Explainable ML Framework for RTL Timing Prediction

This project presents an explainable machine learning framework to predict
post-synthesis timing slack (Worst Negative Slack – WNS) directly from
Register-Transfer Level (RTL) Verilog designs.

## Motivation
Timing closure is an iterative and time-consuming stage in FPGA/ASIC design.
This work enables early-stage timing feasibility checks using static RTL
features, reducing costly late-stage design iterations.

## Project Highlights
- RTL feature extraction from Verilog source code
- Post-synthesis timing analysis using Xilinx Vivado
- Random Forest regression for slack prediction
- SHAP-based explainability for feature attribution
- End-to-end reproducible ML pipeline

## Toolchain
- **RTL & STA:** Xilinx Vivado
- **ML Framework:** Python (scikit-learn)
- **Explainability:** SHAP
- **Simulation:** Vivado post-synthesis timing analysis

## Folder Structure
- `rtl/` – Verilog RTL modules
- `ml/` – Jupyter notebook, datasets, and ML pipeline
- `figures/` – Plots and workflow diagrams

## How to Run
1. Open `ml/rtl_timing_pipeline.ipynb`
2. Run all cells to:
   - Load RTL features
   - Train the model
   - Generate prediction and SHAP plots

## Results
- Mean Percentage Error (MPE): ~9.9%
- R² Score: ~0.69
- Strong correlation between RTL complexity and timing slack

## Author
**K. Sai Srikar**  
LinkedIn: https://www.linkedin.com/in/sai-srikar-2b6a3624a  
GitHub: https://github.com/Srikar109755

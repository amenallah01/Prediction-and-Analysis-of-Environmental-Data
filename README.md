# **Prediction and Analysis of Environmental Data**

## **Overview**
This project explores the application of linear modeling and prediction techniques to environmental data using MATLAB. The focus is on analyzing cause-effect relationships in physical systems and implementing robust prediction methodologies. The project is divided into two main parts:
1. **Surface Temperature Prediction**:
   - Predicting surface temperature from subsurface heat flux using linear causal models.
   - Regularization techniques are applied for numerical stability.
2. **Flood Prediction**:
   - Developing a predictive filter to estimate river discharge based on precipitation data.
   - Using real-world hydrograph data to forecast flood risks.

---

## **Mathematical Formulation**

### **1. Linear Causal Model for Surface Temperature Prediction**
The surface temperature $y_t$ is modeled as a linear combination of the previous $M$ values of subsurface heat $x_t$:

$$y_t = h_1 x_t + h_2 x_{t-1} + \dots + h_M x_{t-M}$$

For $n$ observations:

$$\mathbf{y} = \mathbf{H} \mathbf{x} + \epsilon$$

Where:
- $\mathbf{y}$: Vector of surface temperature measurements.
- $\mathbf{H}$: Matrix of coefficients modeling the system.
- $\mathbf{x}$: Vector of subsurface heat flux values.
- $\epsilon$: Noise vector.

To estimate $\mathbf{x}$, the least squares solution is regularized as:

$$\hat{\mathbf{x}} = (\mathbf{H}^T \mathbf{H} + \epsilon \mathbf{I})^{-1} \mathbf{H}^T \mathbf{y}$$

---

### 2. Predictive Filtering for River Discharge

To predict river discharge $y_t$ based on precipitation $x_t$, a predictive filter $h$ is designed:

$$y_t = h_1 x_t + h_2 x_{t-1} + \dots + h_M x_{t-M}$$

Using a regularized least squares approach:

$$\mathbf{h} = (\mathbf{X}^T \mathbf{X} + \epsilon \mathbf{I})^{-1} \mathbf{X}^T \mathbf{y}$$

Where:
- $\mathbf{h}$: Predictive filter coefficients.
- $\mathbf{X}$: Matrix of precipitation data (Toeplitz structure).
- $\mathbf{y}$: River discharge data.
---

## **Key Features**
- **Linear Causal Modeling**:
  - Predict surface temperature from subsurface heat flux.
  - Address ill-conditioned systems using regularization.
- **Predictive Filtering**:
  - Estimate river discharge based on precipitation data.
  - Visualize and evaluate performance metrics.
- **Error Analysis**:
  - Compute metrics like Mean Squared Error (MSE) and correlation to assess model accuracy.

---

## **Project Structure**
```
Prediction-Analysis-Environmental-Data/
├── README.md                 # Project description and instructions
├── LICENSE                   # Licensing information
├── data/                     # Input datasets (temperature and precipitation data)
│   ├── DATA.mat   # Temperature dataset
│   └── precip_discharge_data.txt   # Precipitation and discharge dataset
├── src/                      # MATLAB scripts
│   └── Data_Analysis.mlx      # Performance evaluation (MSE, correlation)

```

---

## **Applications**
1. **Environmental Monitoring**: Predict surface temperature based on heat flux or forecast river discharge using precipitation data.
2. **Signal Processing**: Apply regularized least squares for stable parameter estimation.
3. **Flood Risk Management**: Build predictive filters to forecast flood risks.

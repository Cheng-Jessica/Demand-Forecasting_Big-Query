## Team 6 - Trendsmarket_BigqueryML

### Problem

To manage the infrastructure to handle continuous model training and forecasting which becomes overwhelming for medium and large businesses

### Solution

Google Cloud Platform - It offers a comprehensive ecosystem of services and tools that can be leveraged to build, train, and deploy advanced time series forecasting models efficiently and at scale. The managed services, scalability, and integration between different components make it a compelling choice for organizations working on time series forecasting applications.

### Dataset (https://www.kaggle.com/competitions/store-sales-time-series-forecasting/data)
We will use this dataset to predict sales for the thousands of product families sold at Favorita stores located in Ecuador. The training data includes dates, store and product information, whether that item was being promoted, as well as the sales numbers. Additional files include supplementary information that may be useful in building your models.


With Big Query ML, we will

·   	train and deploy time forecasting model such as ARIMA using SQL query
·   	fully manage and scale infrastructure to reduce complexity and accelerate time to production
·   	forecast multiple products in parallel with Big Query ML (use TIME_SERIES_ID_COL that can forecast up to 100,000,000 time series simultaneously with a single query)
·   	automatically re-train the model on a regular basis (schedule query weekly, monthly...)
Process we will follow to use Big Query ML in Google Cloud
·   	Pre-process data in the correct format needed to create a demand forecasting model
·   	Train an ARIMA-based time-series model and evaluate the model
·   	Predict the future demand by each store and item over the next 30 days
·   	Test the accuracy of the model using MAPE (Mean Absolute Percentage Error)
·   	Present an interactive dashboard to visualize the forecasted demand using Looker Studio


Big Query ML infrastructure will take care off -
·   	Cleaning adjustments such as missing values, duplicated timestamps, spike anomalies
·   	Holiday effects – inbuilt feature to access holidays across the world
·   	Seasonal and trend decomposition using Loess (STL) algorithm
·   	Seasonality extrapolation using the double exponential smoothing (ETS) algorithm
·   	Trend modeling using ARIMA model and auto.ARIMA algorithm for automatic hyper-parameter tuning. In auto.ARIMA, dozens of candidate models are trained and evaluated in parallel. The model with the lowest Akaike information criterion (AIC) is selected as the best model.

Arima Model workflow as follows -

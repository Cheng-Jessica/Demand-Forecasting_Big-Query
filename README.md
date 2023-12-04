## Team 6 - Trendsmarket_BigqueryML

### Business Problem

To manage the infrastructure to handle continuous model training and forecasting which becomes overwhelming for medium and large businesses

### Our Solution

Google Cloud Platform - It offers a comprehensive ecosystem of services and tools that can be leveraged to build, train, and deploy advanced time series forecasting models efficiently and at scale. The managed services, scalability, and integration between different components make it a compelling choice for organizations working on time series forecasting applications.

### [Dataset](<https://www.kaggle.com/competitions/store-sales-time-series-forecasting/data>)
We will use this dataset to predict sales for the thousands of product families sold at Favorita stores located in Ecuador. The training data includes dates, store and product information, whether that item was being promoted, as well as the sales numbers. Additional files include supplementary information that may be useful in building your models.
- Train.csv: The training data, comprising time series of features *store_nbr*, *family*, and *onpromotion* as well as the target *sales*


#### With Big Query ML, we will

- train and deploy time forecasting model such as ARIMA using SQL query
- fully manage and scale infrastructure to reduce complexity and accelerate time to production
- forecast multiple products in parallel with Big Query ML (use TIME_SERIES_ID_COL that can forecast up to 100,000,000 time series simultaneously with a single query)
- automatically re-train the model on a regular basis (schedule query weekly, monthly...)

#### How to implement this project?
- Sign up for google cloud platform [LINK](<https://cloud.google.com/?hl=en>)
- Go to bigquery page [LINK] (https://cloud.google.com/bigquery?hl=en)
- Step 1: Load your data (prepare your data into the format you desired, bigquery accepts different format)
- Step 2: Please refer to file Step2_bigquery_build_model.sql. It only require SQL.
- Step 3: Build your own dashboard using Looker Studio, which is built-in in bigquery tool.
![Bigquery Structure](https://github.com/Cheng-Jessica/Trendsmarket_BigqueryML/blob/main/Structure_bigquery.jpg)


#### Process we will follow to use Big Query ML in Google Cloud
- Pre-process data in the correct format needed to create a demand forecasting model
- Train an ARIMA-based time-series model and evaluate the model
- Predict the future demand by each store and item over the next 30 days
- Test the accuracy of the model using MAPE (Mean Absolute Percentage Error)
- Present an interactive dashboard to visualize the forecasted demand using Looker Studio

#### Big Query ML infrastructure will take care off -
- Cleaning adjustments such as missing values, duplicated timestamps, spike anomalies
- Holiday effects – inbuilt feature to access holidays across the world
- Seasonal and trend decomposition using Loess (STL) algorithm
- Seasonality extrapolation using the double exponential smoothing (ETS) algorithm
- Trend modeling using ARIMA model and auto.ARIMA algorithm for automatic hyper-parameter tuning. In auto.ARIMA, dozens of candidate models are trained and evaluated in parallel. The model with the lowest Akaike information criterion (AIC) is selected as the best model.

#### Demand Forecasting Dashboard (Store-Item Combination)
- Filter option 1: Store number or Item name or Store-item combination
- Filter option 2: Date Range
![Dashbaord](https://github.com/Cheng-Jessica/Trendsmarket_BigqueryML/blob/main/Step3%20_Dashbaord.jpg)

#### Arima Model workflow as follows -
![ARIMA Structure](https://github.com/Cheng-Jessica/Trendsmarket_BigqueryML/blob/main/arima_structure.jpg)

### Video detail for this project, [LINK](<https://www.youtube.com/watch?v=6MRux_sKrtA&ab_channel=MSBA_Team>)

*Reference 1: [LINK](<https://cloud.google.com/blog/topics/developers-practitioners/how-build-demand-forecasting-models-bigquery-ml>)*
*This project repository is created in partial fulfillment of the requirements for the Big Data Analytics course offered by the Master of Science in Business Analytics program at the Carlson School of Management, University of Minnesota*


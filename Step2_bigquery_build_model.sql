-- Step 1: Prepare Data in Bigquery MLSLABEL
SELECT 
        date,
        store_nbr AS store_no,
        family AS item_name,
        SUM(sales) AS total_amount_sold
    FROM
        `trends-marketplace-405922.Store_item.Store_item_table`
    GROUP BY
        date, item_name, store_no
    HAVING 
        date BETWEEN DATE('2016-01-01') AND DATE('2017-06-01') AND
        total_amount_sold > 0 ;

-- Step 2: Build Model - Built-in Model in bigquery ML

CREATE OR REPLACE MODEL Store_item.arima_model

OPTIONS(
  MODEL_TYPE='ARIMA',
  TIME_SERIES_TIMESTAMP_COL='date', 
  TIME_SERIES_DATA_COL='total_amount_sold',
  TIME_SERIES_ID_COL='store_item_id',
  HOLIDAY_REGION='US'
) AS

WITH store_item_data AS(
  SELECT
    store_no,
    item_name,
    DATE(date) AS date,
    total_amount_sold,
    CONCAT(CAST(store_no AS STRING), "_", item_name) AS store_item_id
  FROM
    `Store_item.train_data`
)

SELECT 
    date,
    store_item_id,
    total_amount_sold
FROM
  store_item_data;
  
-- Step 3: Model Training: Prediction
SELECT *  
FROM ML.FORECAST(MODEL Store_item.arima_model,
                 STRUCT(30 AS horizon, 0.9 AS confidence_level))

-- Step 4: Ouput Data as Dashboard
CREATE OR REPLACE VIEW Store_item.output_datastudio
AS(
  SELECT
    date AS timestamp,
    CONCAT(CAST(store_no AS STRING), "_", item_name) AS store_item_id,
    total_amount_sold AS history_value,
    NULL AS forecast_value,
    NULL AS prediction_interval_lower_bound,
    NULL AS prediction_interval_upper_bound,
  FROM Store_item.train_data

UNION ALL

SELECT
  EXTRACT(date
  FROM forecast_timestamp) AS timestamp,
  store_item_id,
  NULL AS history_value,
  forecast_value,
  prediction_interval_lower_bound,
  prediction_interval_upper_bound,
FROM ML.FORECAST(MODEL Store_item.arima_model,
                 STRUCT(30 AS horizon, 0.9 AS confidence_level))
  ORDER BY timestamp)
  
-- Step 5: Evaluate performance using any performance matric
WITH predictions AS (
  SELECT
    CAST(forecast_timestamp AS DATE) AS date,
    store_item_id,
    forecast_value AS predicted_total_amount_sold
  FROM
    ML.FORECAST(MODEL Store_item.arima_model, STRUCT(30 AS horizon, 0.9 AS confidence_level))
)

SELECT
  AVG(ABS((p.predicted_total_amount_sold - a.total_amount_sold) / a.total_amount_sold)) * 100 AS mape
FROM
  predictions p
JOIN
  `Store_item.true_data` a
ON
  p.store_item_id = a.store_item_id AND p.date = a.date;
  


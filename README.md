# stock-predictor
Stock predictor - Time series model

curl \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"ticker":"MSFT", "days":7}' \
    http://35.88.41.214:8000/predict

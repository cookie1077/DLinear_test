if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
 
# Space, univariate results, pred_len= 24 48 96 192 336 720
# mse:0.0260348841547966, mae:0.12207671254873276
python -u run_longExp.py \
  --is_training 0 \
  --root_path ./dataset/ \
  --data_path ai_competition_test.csv \
  --model_id Space_1 \
  --model DLinear \
  --data custom \
  --features S \
  --seq_len 60 \
  --pred_len 30 \
  --label_len 30 \
  --enc_in 1 \
  --des 'Exp' \
  --itr 1 --batch_size 60 --learning_rate 0.005 >logs/LongForecasting/DLinear_Space_1_test.log

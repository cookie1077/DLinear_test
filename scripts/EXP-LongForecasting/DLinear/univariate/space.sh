if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi

model_id=Space_15
learning_rate=0.00008
patience=10
train_epochs=100
d_model=256
dec_in=3

# Space, univariate results, pred_len= 24 48 96 192 336 720
# mse:0.0260348841547966, mae:0.12207671254873276


python -u run_longExp.py \
  --dec_in $dec_in \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ai_competition_noout.csv \
  --model_id $model_id \
  --model DLinear \
  --data custom \
  --features S \
  --seq_len 60 \
  --pred_len 30 \
  --d_model $d_model \
  --label_len 30 \
  --enc_in 1 \
  --des 'Exp' \
  --patience $patience \
  --train_epochs $train_epochs \
  --itr 1 --batch_size 1 --learning_rate $learning_rate >logs/LongForecasting/DLinear_$model_id.log
  


python -u run_longExp.py \
  --dec_in $dec_in \
  --is_training 0 \
  --root_path ./dataset/ \
  --data_path ai_competition_final.csv \
  --model_id $model_id \
  --model DLinear \
  --data custom \
  --features S \
  --seq_len 60 \
  --pred_len 30 \
  --label_len 30 \
  --enc_in 1 \
  --d_model $d_model \
  --des 'Exp' \
  --patience $patience \
  --train_epochs $train_epochs \
  --itr 1 --batch_size 60 --learning_rate $learning_rate >logs/LongForecasting/DLinear_$model_id'_'test.log

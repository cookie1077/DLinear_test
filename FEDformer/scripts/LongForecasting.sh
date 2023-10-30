# cd FEDformer
if [ ! -d "../logs" ]; then
    mkdir ../logs
fi

if [ ! -d "../logs/LongForecasting" ]; then
    mkdir ../logs/LongForecasting
fi

preLen=30
task_id=Test3
checkpoints=../
learning_rate=0.00001
patience=5
epochs=10

# training
python -u run.py \
  --learning_rate $learning_rate \
  --train_epochs $epochs \
  --is_training 1 \
  --data_path ai_competition_nonan.csv  \
  --task_id $task_id\
  --model FEDformer \
  --patience $patience \
  --data custom \
  --features S \
  --seq_len 60 \
  --label_len 30 \
  --pred_len $preLen \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 1 \
  --dec_in 1 \
  --c_out 1 \
  --des 'Exp' \
  --d_model 128 \
  --batch_size 8 \
  --checkpoints $checkpoints \
  --itr 1  >$checkpoints/FEDformer_$task_id.log


# testing


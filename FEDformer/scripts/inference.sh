# cd FEDformer
if [ ! -d "../logs" ]; then
    mkdir ../logs
fi

if [ ! -d "../logs/LongForecasting" ]; then
    mkdir ../logs/LongForecasting
fi

preLen=30
task_id=Test1
checkpoints=/output/

# testing

python -u run.py \
  --is_training 0 \
  --root_path /input \
  --data_path ai_competition_test.csv  \
  --task_id $task_id\
  --model FEDformer \
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
  --d_model 512 \
  --batch_size 60 \
  --checkpoints $checkpoints \
  --itr 1 # >$checkpoints/FEDformer_$task_id.log
#!/usr/bin/env bash

  python BERT_NER_yo.py\
    --task_name="NER"  \
    --do_lower_case=True \
    --crf=False \
    --do_train=True   \
    --do_eval=True   \
    --do_predict=True \
    --data_dir=ner_data/uncased_nodiacritics_ner_data   \
    --vocab_file=bert_models/multilingual_L-12_H-768_A-12/vocab.txt  \
    --bert_config_file=bert_models/multilingual_L-12_H-768_A-12/bert_config.json \
    --init_checkpoint=bert_models/no_diacritics_bert_vocab/model.ckpt-50000   \
    --max_seq_length=128   \
    --train_batch_size=32   \
    --learning_rate=2e-5   \
    --num_train_epochs=10.0   \
    --output_dir=./yoruba_outputFMB/result_dir


perl conlleval.pl -d '\t' < ./yoruba_outputFMB/result_dir/label_test.txt


# Activate python venv
.\venv\Scripts\activate

# torchrun win_run.py --ckpt_dir $TARGET_FOLDER/model_size --tokenizer_path $TARGET_FOLDER/tokenizer.model
torchrun win_run.py --ckpt_dir D:\Work\AI\download_models\LLaMA\7B --tokenizer_path D:\Work\AI\download_models\LLaMA\tokenizer.model


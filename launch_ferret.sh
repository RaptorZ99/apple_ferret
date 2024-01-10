#!/bin/bash

# Activer l'environnement conda
conda activate ferret

# Lancer le controller
python -m ferret.serve.controller --host 0.0.0.0 --port 10000 &
sleep 1

# Lancer le serveur web Gradio
python -m ferret.serve.gradio_web_server --controller http://localhost:10000 --model-list-mode reload --add_region_feature &
sleep 1

# Lancer le model worker
python -m ferret.serve.model_worker --host 0.0.0.0 --controller http://localhost:10000 --port 40000 --worker http://localhost:40000 --model-path ./model/ferret-7b-v1.5 --add_region_feature &

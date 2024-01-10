#!/bin/bash

# Tuer le processus du controller
pkill -f 'python -m ferret.serve.controller'

# Tuer le processus du serveur web Gradio
pkill -f 'python -m ferret.serve.gradio_web_server'

# Tuer le processus du model worker
pkill -f 'python -m ferret.serve.model_worker'
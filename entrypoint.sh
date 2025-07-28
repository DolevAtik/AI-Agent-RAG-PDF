#!/bin/bash

echo "🚀 Starting Ollama server..."
ollama serve &

# תחכה שהשרת יעלה
sleep 10

# פונקציה שמוודאת אם מודל כבר קיים
pull_if_needed() {
  MODEL_NAME=$1
  if ollama list | grep -q "$MODEL_NAME"; then
    echo "✅ Model '$MODEL_NAME' already exists. Skipping download."
  else
    echo "⬇️ Pulling model: $MODEL_NAME"
    ollama pull "$MODEL_NAME"
  fi
}

# הורדה חכמה
pull_if_needed nomic-embed-text
pull_if_needed mistral

echo "🎉 All models are ready! You can start sending requests to the API "
# שמור את המכולה חיה
wait

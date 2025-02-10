
curl -X POST "http://localhost:8080/v1/chat/completions" -H "Content-Type: application/json" --data '{
  "model": "deepseek-ai/DeepSeek-R1-Distill-Qwen-32B",
  "messages": [
  {
  "role": "user",
  "content": "Alice and Bob play the following game. A stack of n tokens lies before them. The players take turns with Alice going first. On each turn, the player removes either 1 token or 4 tokens from the stack. Whoever removes the last token wins. Find the number of positive integers n less than or equal to 2024 for which there exists a strategy for Bob that guarantees that Bob will win the game regardless of Alice play. \n The correct answer is 1688, could you explain why?"
  }
  ]
  }'



genai-perf profile -m deepseek-ai/DeepSeek-R1-Distill-Qwen-32B \
  --url deepseek-svc-qwen-32b \
  --service-kind openai \
  --endpoint-type chat \
  --num-prompts 100 \
  --synthetic-input-tokens-mean 200 \
  --synthetic-input-tokens-stddev 0 \
  --output-tokens-mean 100 \
  --output-tokens-stddev 0 \
  --concurrency 20 \
  --streaming \
  --tokenizer hf-internal-testing/llama-tokenizer


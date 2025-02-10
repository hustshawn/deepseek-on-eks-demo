# DeepSeek on EKS Demo

## Project Description

This project demonstrates the deployment and management of DeepSeek AI models on Amazon Elastic Kubernetes Service (EKS). It showcases various large language models, including Qwen-14B, Qwen-32B, and DeepSeek-R1-Distill-Llama-8B, using vLLM for efficient inference. The project also includes node pool management with Karpenter, performance testing capabilities, and a user-friendly web interface for interacting with the models.

## Components

### Deployments

1. **Qwen-14B Deployment** (`qwen-14b-deployment.yaml`)
   - Deploys the `DeepSeek-R1-Distill-Qwen-14B` model
   - Uses vLLM for serving
   - Configured with GPU support

2. **Qwen-32B Deployment** (`qwen-32b-deployment.yaml`)
   - Deploys the `DeepSeek-R1-Distill-Qwen-32B` model
   - Similar configuration to Qwen-14B, but with adjusted resource requirements

3. **DeepSeek-R1-Distill-Llama-8B Deployment** (`deployment.yaml`)
   - Deploys the `DeepSeek-R1-Distill-Llama-8B` model
   - Uses vLLM for serving
   - Configured with GPU support

### Node Pools

1. **GPU Node Pool** (`nodepool.yaml`)
   - Configures Karpenter for managing GPU-enabled nodes
   - Supports various GPU instance types (g5, g6, g6e, p5, p4)
   - Includes both spot and on-demand instances

2. **ML Accelerator Node Pool** (`nodepool.yaml`)
   - Configures Karpenter for managing nodes with AWS Inferentia and Trainium
   - Supports instance families: inf1, inf2, trn1, trn1n

### Performance Testing

- **GenAI Performance Tool** (`genai-perf.yaml`, `prompts.sh`)
   - Deploys a Triton Inference Server for performance testing
   - Includes scripts for running performance profiles on the deployed models

### User Interface

- **Open-WebUI** (`open-webui.yaml`)
   - Deploys a web-based user interface for interacting with the DeepSeek AI models
   - Connects to the deployed vLLM services

## Setup and Usage

1. **Prerequisites**
   - Amazon EKS cluster
   - kubectl configured to access your cluster
   - Karpenter installed and configured

2. **Node Pool Configuration**
   - Apply the node pool configurations:

     ```bash
     kubectl apply -f nodepool.yaml
     ```

3. **Deployment**
   - Apply the deployment YAML files:

     ```bash
     kubectl apply -f qwen-14b-deployment.yaml
     kubectl apply -f qwen-32b-deployment.yaml
     kubectl apply -f deployment.yaml
     ```

4. **Performance Testing**
   - Deploy the Triton Inference Server:

     ```bash
     kubectl apply -f genai-perf.yaml
     ```
   - Use the `prompts.sh` script to run performance tests

5. **User Interface**
   - Deploy the Open-WebUI:

     ```bash
     kubectl apply -f open-webui.yaml
     ```
     
   - Access the UI through the exposed service

## Project Structure

```text
.
├── deployment.yaml
├── genai-perf.yaml
├── nodepool.yaml
├── open-webui.yaml
├── prompts.sh
├── qwen-14b-deployment.yaml
├── qwen-32b-deployment.yaml
└── README.md
```

## Contributing

Contributions to this project are welcome. Please refer to the CONTRIBUTING.md file for guidelines.

## License

This project is licensed under [LICENSE_NAME]. Please see the LICENSE file for details.
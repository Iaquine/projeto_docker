# Usar uma imagem base mais leve com suporte a Python
FROM python:3.8-slim

# Atualiza os pacotes do sistema e instala dependências essenciais
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    libgl1-mesa-glx \  
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*  

# Cria um diretório de trabalho para organizar arquivos e códigos do projeto
WORKDIR /workspace

# Cria um ambiente virtual Python para evitar conflitos de pacotes globais
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Instala bibliotecas essenciais para IA generativa e processamento de dados
RUN pip install --no-cache-dir \
    torch torchvision torchaudio \  
    transformers diffusers \  
    opencv-python numpy pandas matplotlib tqdm \  
    scipy scikit-learn flask fastapi uvicorn \  
    jupyterlab notebook gradio \  
    accelerate sentence-transformers \  
    datasets pillow requests seaborn plotly \  
    black isort flake8 tensorboard \  
    && rm -rf /root/.cache/pip  

# Copia os arquivos do projeto para dentro do container
COPY . /workspace

# Ajusta permissões para garantir acesso adequado a todos os arquivos do projeto
RUN chmod -R 777 /workspace

# Define variáveis de ambiente para otimizar desempenho do PyTorch
ENV OMP_NUM_THREADS=8  
ENV CUDA_VISIBLE_DEVICES=0  

# Expõe portas para acesso a aplicações web e JupyterLab
EXPOSE 5000 8888

# Comando padrão ao iniciar o container - inicia um shell interativo
CMD ["bash"]

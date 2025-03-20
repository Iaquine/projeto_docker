# **Imagem Docker para IA com PyTorch e CUDA**

Este projeto consiste na criação de uma imagem Docker otimizada para aprendizado profundo, utilizando PyTorch com suporte a CUDA para aceleração por GPU. A imagem base utilizada é a NVIDIA PyTorch disponibilizada no NVIDIA NGC (NVIDIA GPU Cloud), garantindo compatibilidade total com GPUs NVIDIA e suas bibliotecas associadas.

O ambiente conta com diversas ferramentas essenciais para o desenvolvimento de modelos de Inteligência Artificial e Machine Learning, incluindo bibliotecas como Transformers, Diffusers e Scikit-Learn, além de frameworks para desenvolvimento de APIs e interfaces gráficas, como Flask, FastAPI e Gradio. A imagem também inclui ferramentas para processamento de imagens e vídeos, como OpenCV e FFmpeg, e pacotes para visualização de dados, como Matplotlib, Seaborn e Plotly.

Para manter o ambiente leve e eficiente, utilizamos um ambiente virtual Python dentro do container, prevenindo conflitos de dependências. Além disso, pacotes desnecessários são removidos após a instalação para reduzir o tamanho da imagem. O diretório de trabalho padrão dentro do container é o /workspace, onde os arquivos do projeto são armazenados.

A imagem expõe as portas 5000 e 8888, permitindo o acesso a servidores web e ao JupyterLab, facilitando o desenvolvimento interativo de modelos. O container pode ser iniciado com um terminal interativo através do comando padrão "bash".

1. **Login no Docker Hub**

Antes de construir e enviar a imagem para o Docker Hub, é necessário realizar o login. A recomendação é utilizar um token de acesso, que pode ser gerado no Docker Hub.

Após gerar o token, utilize o seguinte comando para login direto no terminal:

`echo "SEU_TOKEN_DE_ACESSO" | docker login --username SEU_USUARIO --password-stdin`

Caso prefira, o login também pode ser feito interativamente com:

docker login

Isso abrirá um prompt para inserir suas credenciais do Docker Hub.

2. **Construção da Imagem**

Para construir a imagem Docker, execute:

`docker build -t nome-do-repositorio/nome-da-imagem:latest .`


Isso criará a imagem localmente com a tag latest.

3. **Executando o Container**

A imagem pode ser executada de diferentes formas:

3.1. **No Docker Desktop CLI**

Se estiver usando o Docker Desktop, o container pode ser iniciado pelo terminal integrado com:

`docker run -it --gpus all nome-do-repositorio/nome-da-imagem:latest`


Isso abrirá um terminal interativo dentro do container.

3.2. **No Terminal do VS Code**

Caso esteja utilizando o Visual Studio Code, você pode abrir um terminal integrado e executar o container normalmente com o mesmo comando:

`docker run -it --gpus all nome-do-repositorio/nome-da-imagem:latest`

Além disso, se você quiser acessar diretamente os arquivos do seu projeto dentro do container, pode abrir o Docker Explorer no VS Code e anexar o terminal a um container em execução.

4. **Subindo a Imagem para o Docker Hub**

Após construir e testar a imagem, ela pode ser enviada para o Docker Hub para ser reutilizada em outras máquinas:

`docker push nome-do-repositorio/nome-da-imagem:latest`

Esse projeto fornece um ambiente otimizado para experimentação e desenvolvimento de modelos de IA com alto desempenho, facilitando a replicação do ambiente em diferentes máquinas e melhorando o fluxo de trabalho com Docker e GPUs NVIDIA.


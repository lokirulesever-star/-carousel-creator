FROM python:3.11-slim

# Instala fontes e dependências do sistema
RUN apt-get update && apt-get install -y \
    fonts-dejavu-core \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia e instala dependências Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o projeto completo
COPY . .

# Expõe a porta usada pelo Railway
EXPOSE 8080

# Inicia o servidor apontando para a pasta backend
CMD ["uvicorn", "backend.server:app", "--host", "0.0.0.0", "--port", "8080"]

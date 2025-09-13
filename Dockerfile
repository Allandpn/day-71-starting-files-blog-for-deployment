# Base image com Python 3.11
FROM python:3.11.9-slim

# Diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências e instala
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o restante do código para o container
COPY . .

# Porta usada pelo Render (ou Gunicorn)
ENV PORT=10000

# Comando para iniciar a aplicação
CMD ["gunicorn", "main:app", "--bind", "0.0.0.0:10000"]
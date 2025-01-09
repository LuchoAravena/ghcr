# Usar la imagen base de Ruby
FROM ruby:3.1.0

# Instalar dependencias
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Crear y configurar el directorio de la aplicación
WORKDIR /app

# Copiar Gemfile y Gemfile.lock para instalar gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copiar el resto de la aplicación
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando de inicio del servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]

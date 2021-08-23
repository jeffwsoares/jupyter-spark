FROM ubuntu:bionic

# Instalação Python
RUN apt-get update -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y

# Instalando Jupyterlab
RUN pip3 install jupyterlab

# Instalando o Spark
RUN pip3 install pyspark

# Instalando o Java
RUN apt-get install openjdk-8-jdk -y
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Portas
EXPOSE 8888

# Workdir
WORKDIR /opt/sandbox

# Entrypoint
ENTRYPOINT [ "jupyter-lab","--no-browser","--ip=\"0.0.0.0\"", "--allow-root" ]

FROM jupyter/datascience-notebook

USER root

# Install python library
RUN pip3 install xgboost

# Install dtreeviz
RUN apt-get dist-upgrade && apt-get update && apt-get install build-essential && apt-get install graphviz -y

RUN pip install dtreeviz dtreeviz[boost] dtreeviz[pyspark]

# Enable Hinterland
RUN pip install jupyter-contrib-nbextensions
RUN pip install jupyter-nbextensions-configurator

RUN jupyter contrib nbextension install
RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable hinterland

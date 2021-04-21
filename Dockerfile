FROM jupyter/datascience-notebook

# Install Jupyter Notebook extensions
RUN conda install -y -c conda-forge jupyter_contrib_nbextensions

# Install python library
RUN pip install --upgrade pip

# -------Install XGBoost --------
USER root

# install gcc with openmp support in conda
RUN conda install -y gcc

# download and build xgboost
RUN cd /opt && \
	git clone --recursive https://github.com/dmlc/xgboost && \
	cd xgboost && \
	make -j4

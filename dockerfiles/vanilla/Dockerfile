# FROM jupyter/tensorflow-notebook:95ccda3619d0
FROM jupyter/tensorflow-notebook:latest

USER root

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    atool \
    build-essential \
    curl \
    cvs \
    fonts-dejavu \
    gcc \
    gfortran \
    jq \
    netcat \
    pv \
    ssh \
    tar \
    wget \
    zip \
    graphviz \
    imagemagick \
    make \
    latexmk \
    lmodern \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-cjk \
    texlive-lang-japanese \
    texlive-luatex \
    texlive-xetex \    
  && rm -rf /var/lib/apt/lists/*


USER $NB_UID

RUN set -x \
  && conda config --append channels conda-forge \
  && conda config --append channels anaconda \
  && conda install --yes -c conda-forge rise \
  && pip install --use-feature=2020-resolver Sphinx==3.3.1 Pillow pyarrow parsel panel param holoviews datashader tensorflow-probability transformers[sentencepiece] pandas tensorflow_hub nltk wordcloud spacy emoji textblob vaderSentiment afinn gensim umap-learn lightgbm biterm optuna plotly pyldavis facets-overview \
  && python -m spacy download en_core_web_sm \ 
  && pip install --use-feature=2020-resolver mlxtend \
  && conda clean --all -f -y \
  && fix-permissions $CONDA_DIR \
  && fix-permissions /home/$NB_USER
# FROM jupyter/tensorflow-notebook:95ccda3619d0
FROM tensorflow/tensorflow:2.4.0rc2-gpu-jupyter


RUN pip install --use-feature=2020-resolver tensorflow-probability transformers[sentencepiece] pandas tensorflow_hub nltk emoji gensim umap-learn pydot

RUN pip install --use-feature=2020-resolver Sphinx==3.3.1 Pillow pyarrow parsel panel param holoviews datashader wordcloud spacy textblob vaderSentiment afinn lightgbm biterm optuna plotly pyldavis facets-overview
#The following two packages mess with tf-gpu:
# RUN pip install --use-feature=2020-resolver --user -q tf-models-official==2.3.0  tensorflow_text 
# RUN pip uninstall -y tensorflow==2.4.0
# RUN export export PATH=$PATH:/root/.local/bin
RUN apt-get install -y --no-install-recommends graphviz
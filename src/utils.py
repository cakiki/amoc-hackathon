import pandas as pd
import numpy as np
import tensorflow_hub as hub
import tensorflow as tf
from tqdm.notebook import tqdm_notebook
from transformers import TFAutoModel, TFBertModel
from transformers import BertweetTokenizer, AutoTokenizer

def tf_hub_embedder(df, col, model, batch_size=512):
    dataset = tf.data.Dataset.from_tensor_slices(df[col].values)
    dataset = dataset.batch(batch_size)
    embeddings = []
    for batch in tqdm_notebook(dataset, total=dataset.cardinality().numpy()):
        embedding = model(batch)
        embeddings.append(embedding.numpy())
    return np.vstack(embeddings)

def huggingface_embedder(df, col, tokenizer, model, batch_size=512):
    to_tokenize = df[col].values
    tokenized = tokenizer(list(to_tokenize), padding=True, truncation=True, return_tensors='tf', return_token_type_ids=False)
    inputs = tokenized['input_ids']
    masks = tokenized['attention_mask']
    dataset = tf.data.Dataset.from_tensor_slices((inputs, masks))
    dataset = dataset.batch(batch_size)
    embeddings = []
    for input_tensor, attention_mask in tqdm_notebook(dataset, total=dataset.cardinality().numpy()):
        output = model([input_tensor, attention_mask])
        embeddings.append(output.pooler_output.numpy())
    return np.vstack(embeddings)
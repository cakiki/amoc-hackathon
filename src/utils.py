def tf_hub_embedder(df, col, model, batch_size=512):
    dataset = tf.data.Dataset.from_tensor_slices(df[col].values)
    dataset = dataset.batch(batch_size)
    embeddings = []
    for batch in tqdm_notebook(dataset, total=dataset.cardinality().numpy()):
        embedding = model(batch)
        embeddings.append(embedding.numpy())
    return np.vstack(embeddings)
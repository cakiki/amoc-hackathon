vanilla-docker-build-image:
	docker build -t amoc:0.0.1 ./dockerfiles/vanilla/

gpu-docker-build-image:
	docker build -t amoc-gpu:0.0.1 ./dockerfiles/gpu/

vanilla-docker-run-jupyter:
	docker run --rm -it -p 8888:8888 -p 9999:9999 -p 6006:6006 \
	--env PYTHONPATH=/home/jovyan/work/src \
	--mount type=bind,source=${PWD},target=/home/jovyan/work --name amoc-vanilla \
	--workdir=/home/jovyan/work \
	 amoc:0.0.1

network-vanilla-docker-run-jupyter:
	docker run --rm -it --network host \
	--env PYTHONPATH=/home/jovyan/work/src \
	--mount type=bind,source=${PWD},target=/home/jovyan/work --name amoc-vanilla \
	--workdir=/home/jovyan/work \
	 amoc:0.0.1

gpu-docker-run-jupyter:
	docker run --rm -it -p 8888:8888 --gpus all --env PYTHONPATH=/tf/src --name amoc-gpu \
			--mount type=bind,source=${PWD},target=/tf --workdir=/tf \
			amoc-gpu:0.0.1

fix-permissions:
	sudo chown -R 1000:1000 .

docker-run-rapids:
	docker run --gpus all --rm -it -p 8888:8888 -p 8787:8787 -p 8786:8786 \
		--mount type=bind,source=${PWD},target=/rapids/project \
		--workdir=/rapids --env PYTHONPATH=/rapids/project/src \
    	rapidsai/rapidsai-core:cuda10.2-runtime-ubuntu18.04

docker-network-run-rapids:
	docker run --gpus all --rm -it --network host \
		--mount type=bind,source=${PWD},target=/rapids/project \
		--workdir=/rapids --env PYTHONPATH=/rapids/project/src \
    	rapidsai/rapidsai-core:cuda10.2-runtime-ubuntu18.04

base-dataset:
	python3 src/generate-base-dataset.py --input "data/hackathon_dataset/fora/*.csv" --output "data/base.parquet"

vanilla-docker-base-dataset:
	docker exec amoc python src/generate-base-dataset.py --input "data/hackathon_dataset/fora/*.csv" --output "data/base.parquet"

gpu-docker-base-dataset:
	docker exec amoc-gpu python src/generate-base-dataset.py --input "data/hackathon_dataset/fora/*.csv" --output "data/base.parquet"
    
# File download targets
download-original:
	sh data/download.sh 1ccXju1ZkyqKn8yBZV4TPkz166JRWKg3F data/hackathon_dataset.zip
	unzip data/hackathon_dataset.zip -d data/hackathon_dataset
	rm data/hackathon_dataset.zip

download-base:
	sh data/download.sh 1Co8oS32F2AthYcUbsgRj36DqIpjgtA6E  data/base.parquet

download-embeddings: download-embeddings-body download-embeddings-subject download-embeddings-category

download-embeddings-body:
	sh data/download.sh 1olZ1xCFF5JLCb8cQpCJstxbrzvZmpqKh  data/body_embeddings.npy

download-embeddings-category:
	sh data/download.sh 10EtGe4jk4dZTtPRiWma2uxtw2RMubwN6  data/category_embeddings.npy

download-embeddings-subject:
	sh data/download.sh 1SwYpavtV9p8C7pp-Y_F9ycGC9HzKmhX0  data/subject_embeddings.npy

download-embeddings-bertweet:
	sh data/download.sh 1OsYqdc-nmtsAtelfvHkVgsF-XMOR0i7B data/body_bertweet_embeddings.npy

download-dashboard-dataset:
	sh data/download.sh 1QzwQdYNFlMJX3GQTgq8AKZZRJhixaWJK data/final.parquet
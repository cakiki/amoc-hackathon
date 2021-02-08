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

base-dataset:
	python3 src/data/generate-base-dataset.py --input "data/hackathon_dataset/fora/*.csv" --output "data/base.parquet"

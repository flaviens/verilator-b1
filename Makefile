IMAGE_TAG ?= ethcomsec/verilator-b1

build_docker:
	docker build -t $(IMAGE_TAG) . 2>&1 | tee build.log

run_docker:
	docker run -it $(IMAGE_TAG)

push_docker:
	docker push $(IMAGE_TAG)

run_verilator: tb.cc top.sv
	verilator --cc --exe --build ../$< $(word 2,$^)

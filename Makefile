all: 1.12 1.13 1.16

1.12:
	docker build -t articulate/articulate-golang:1.12 1.12
.PHONY: 1.12

1.13:
	docker build -t articulate/articulate-golang:1.13 1.13
.PHONY: 1.13

1.16:
	docker build -t articulate/articulate-golang:1.16 1.16
.PHONY: 1.16

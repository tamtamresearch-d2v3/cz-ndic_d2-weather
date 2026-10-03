# Lokální spouštění přes Docker image docs-kitu
IMAGE ?= ghcr.io/tamtamresearch-d2v3/ndic-docs-kit:0.6.2
RUN = docker run --rm -v "$(CURDIR):/work" -w /work $(IMAGE)

.PHONY: check tables docs spec
check: ; $(RUN) d2doc check .
tables: ; $(RUN) d2doc tables . --out build
docs: ; $(RUN) d2doc build . --out build
spec: ; $(RUN) d2doc spec-zip . --out build

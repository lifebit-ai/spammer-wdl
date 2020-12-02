# Spammer WDL

# 1 - Introduction

The WDL equivalent of `lifebit-ai/spammer-nf`.

# 2 - Quick start

To generate inputs.json file (rough equivalent of `nextflow.config`):
```
$ java -jar ~/cromwell/womtool-53.1.jar inputs main.wdl > inputs.json
# One can then populate the inputs.json
```

To run the pipeline:
```
$ java -jar ~/cromwell/cromwell-53.1.jar run main.wdl -i inputs.json
```



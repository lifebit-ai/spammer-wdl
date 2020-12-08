# Spammer WDL

# 1 - Introduction

This pipeline is the WDL equivalent of `lifebit-ai/spammer-nf`.

# 2 - Quick start

## Generate an input.json file

Inputs are to this pipeline are supplied via an `inputs.json`. One can semi-automate its generation by running:
```
$ java -jar ~/cromwell/womtool-53.1.jar inputs main.wdl > inputs.json
# One can then populate the inputs.json
```

Note that this pipeline also uses an `options.json` file to set important workflow paramaters (`docker` settings, results directory etc).

## Validate the script syntax (useful during development)

To validate your `main.wdl` syntax (i.e. to check that everything looks ok):
```
java -jar ~/cromwell/womtool-53.1.jar validate main.wdl

# If successful, you will see:
Success!
```

## To generate a pipeline graph (if need be)

If one wants to visualize a graph of this plot, one can run:
```
java -jar ~/cromwell/womtool-53.1.jar graph main.wdl > main.dot
```
The resulting file can then be pasted into a tool like `Graphviz online`: https://dreampuf.github.io/GraphvizOnline/. 

## Run the pipeline

To run the pipeline:
```
$ java -jar ~/cromwell/cromwell-53.1.jar run main.wdl -i inputs.json -o options.json
```



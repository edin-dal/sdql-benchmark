# Running benchmarks

## Setup

### Link the SDQL repository

Create a symlink to the main SDQL repository:

```sh
# clone the sdql repo somewhere (e.g. home directory)
cd ~ && git clone https://github.com/edin-dal/sdql/
# create a symlink here to the SDQL programs directory
cd - && ln -s ~/sdql/progs progs
```

### Install Python version and virtualenv

Install `pyenv`:

```sh
curl https://pyenv.run | bash
```

On macOS:

```sh
brew install pyenv
```

Get the required Python version:

```sh
export VERSION=$(cat pyproject.toml| grep -Poi '^python = "\K(\d+.\d+.\d+)')
```

On macOS run it as `ggrep` after `brew install grep` to use GNU grep:

```sh
export VERSION=$(cat pyproject.toml| ggrep -Poi '^python = "\K(\d+.\d+.\d+)')
```

Create an environment with the required version:

```sh
pyenv install $VERSION
pyenv virtualenv $VERSION sdql
```

Setting it as the local environment will activate it:

```sh
pyenv local sdql
```

### Install Poetry manager and packages

Install the package manager `poetry`:

```sh
curl -sSL https://install.python-poetry.org | python3 -
```

Install the required packages to your environment:

```sh
poetry install
```

## Run

Make sure you have datasets in `progs/../datasets/tpch/`.

We suggest generating them with `s -1`.

Then run the benchmarks as follows:

```sh
export PYTHONPATH=. && python __main__.py
```

[//]: # (note: intentionally "hiding" this from the public README
For JOB benchmarks, run `export PYTHONPATH=. && python plot_gf_fj.py`.
They require converting from Parquet to CSV the datasets of https://github.com/SIGMOD23p561/free-join.
The results are compared and plotted against those stored in the `timings` directory, which you need to regenerate on your machine using the https://github.com/edin-dal/WCOJ or free-join repositories.
)

# Running benchmarks

_⚠️ This repo was originally a directory in the root of https://github.com/edin-dal/sdql – scripts may assume this directory structure._

## Setup

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

On macOs run it as `ggrep` after `brew install grep` to use GNU grep:

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

Make sure you have datasets in `../datasets/tpch/`.

We suggest generating them with `s -1`.

Then run the benchmarks as follows:

```sh
export PYTHONPATH=. && python __main__.py
```

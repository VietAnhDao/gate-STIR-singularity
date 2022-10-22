mkdir /software/PYTHON
mkdir -p /software/PYTHON/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /software/PYTHON/miniconda3/miniconda.sh
bash /software/PYTHON/miniconda3/miniconda.sh -b -u -p /software/PYTHON/miniconda3
rm -rf /software/PYTHON/miniconda3/miniconda.sh
/software/PYTHON/miniconda3/bin/conda init bash

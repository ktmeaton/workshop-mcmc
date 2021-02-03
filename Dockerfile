FROM continuumio/miniconda3

LABEL authors="Katherine Eaton" \
      description="Docker image containing dependencies for ktmeaton/workshop-mcmc."

# Add conda environments
COPY environment.yaml .

# Create conda environment
RUN conda install -c conda-forge mamba \
    && mamba env create -f environment.yaml \
    && mamba clean -a \
    && echo "source activate workshop-mcmc" > ~/.bashrc;

ENV PATH /opt/conda/envs/workshop-mcmc/bin:$PATH
ENV IN_DOCKER_CONTAINER Yes

# Capture conda env details
RUN conda env export --name workshop-mcmc > workshop-mcmc.yaml
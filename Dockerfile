FROM astrocrpublic.azurecr.io/runtime:3.0-8


# install dbt into a virtual environment
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --upgrade pip && \
    pip install dbt-core==1.10.8 dbt-snowflake==1.10.0
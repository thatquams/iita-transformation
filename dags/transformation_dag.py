from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
# from cosmos.profiles import PostgresUserPasswordProfileMapping
from cosmos.profiles import SnowflakeUserPasswordProfileMapping
import os
from datetime import datetime
from airflow.sdk import Variable



airflow_home = os.environ["AIRFLOW_HOME"]

profile_config = ProfileConfig(
    profile_name="iita_agriculture",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_conn",
        profile_args={"schema": Variable.get("snowflake_schema"), 
                      "database": Variable.get("snowflake_db"), "warehouse": Variable.get("snowflake_wh"),
                      "account": Variable.get("snowflake_account")},
    ),
)


dag = DbtDag(
    
    project_config = ProjectConfig(
        f"{airflow_home}/dags/iita_agriculture",
    ),
    
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=f"{airflow_home}/dbt_venv/bin/dbt",  # Path to dbt executable in the virtual environment
    ),
    # dag parameters
    schedule="@daily",
    start_date=datetime(2023, 1, 1),
    catchup=False,
    dag_id="transformation_dag",
    default_args={"retries": 2},
    description="A DAG to run dbt models for IITA Agriculture project",
    tags=["iita_agriculture"]
)

    

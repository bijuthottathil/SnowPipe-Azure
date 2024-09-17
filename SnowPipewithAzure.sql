CREATE OR REPLACE DATABASE SNOWPIPE

-- create integration object
CREATE OR REPLACE STORAGE INTEGRATION azure_snowpipe_integration
TYPE=EXTERNAL_STAGE
STORAGE_PROVIDER=AZURE
ENABLED = TRUE
AZURE_TENANT_ID = 'your tenant id'
STORAGE_ALLOWED_LOCATIONS = ('azure://snowpipestoragebiju.blob.core.windows.net/snowpipecsv');


DESCRIBE STORAGE INTEGRATION azure_snowpipe_integration
-- create file format

CREATE OR REPLACE FILE FORMAT SNOWPIPE.PUBLIC.FILEFORMAT_AZURE
TYPE=CSV
FIELD_DELIMITER=','
SKIP_HEADER=1;

-- Create Stage

CREATE OR REPLACE STAGE SNOWPIPE.PUBLIC.STAGE_AZURE 
STORAGE_INTEGRATION = azure_snowpipe_integration
URL='azure://snowpipestoragebiju.blob.core.windows.net/snowpipecsv'
FILE_FORMAT=FILEFORMAT_AZURE

LIST @SNOWPIPE.PUBLIC.STAGE_AZURE 


-- create notification integration with queue

CREATE OR REPLACE NOTIFICATION INTEGRATION snowpipe_event
ENABLED= true
TYPE = QUEUE
NOTIFICATION_PROVIDER= AZURE_STORAGE_QUEUE
AZURE_STORAGE_QUEUE_PRIMARY_URI='https://snowpipestoragebiju.queue.core.windows.net/snowpipequeue'
AZURE_TENANT_ID = 'your tenant id'

DESC NOTIFICATION INTEGRATION snowpipe_event


SELECT 
$1,
$2,
$3,
$4,
$5,
$6,
$7,
$8,
$9,
$10,$11,$12,$13,
$14,
$15,
$16,
$17,
$18,
$19,
$20
FROM @snowpipe.public.stage_azure;

-- create new table to load this data
create or replace table snowpipe.public.happiness (
    country_name varchar,
    regional_indicator varchar,
    ladder_score number(4,3),
    standard_error number(4,3),
    upperwhisker number(4,3),
    lowerwhisker number(4,3),
    logged_gdp number(5,3),
    social_support number(4,3),
    healthy_life_expectancy number(5,3),
    freedom_to_make_life_choices number(4,3),
    generosity number(4,3),
    perceptions_of_corruption number(4,3),
    ladder_score_in_dystopia number(4,3),
    explained_by_log_gpd_per_capita number(4,3),
    explained_by_social_support number(4,3),
    explained_by_healthy_life_expectancy number(4,3),
    explained_by_freedom_to_make_life_choices number(4,3),
    explained_by_generosity number(4,3),
    explained_by_perceptions_of_corruption number(4,3),
    dystopia_residual number (4,3));
    
-- load data in to table
COPY INTO HAPPINESS
FROM @snowpipe.public.stage_azure;
truncate table HAPPINESS
commit;

-- creating snowpipe

CREATE OR REPLACE PIPE azure_pipe
auto_ingest=true
integration='SNOWPIPE_EVENT' --  this is integration object we created ealier
as copy into HAPPINESS
FROM @snowpipe.public.stage_azure;

select * from happiness 

-- To check the status of pipe

select system$pipe_status('AZURE_PIPE')

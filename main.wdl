version 1.0

# ========================================================================================
#                         lifebit-ai/spammer-wdl
# ========================================================================================
# lifebit-ai/spammer-wdl pipeline
# #### Homepage / Documentation
# https://github.com/lifebit-ai/spammer-wdl
# ----------------------------------------------------------------------------------------



# ---------
# Workflow
# ---------

workflow spammer_wdl {

  call task_A
}



# -------
# Task A
# -------

task task_A{
    command {
    echo "hello"
    }
}
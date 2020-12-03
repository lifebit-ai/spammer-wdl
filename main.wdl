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

task task_A {
    input {
        String processATimeRange
        Int numberFilesForProcessA
        Int processATimeBetweenFileCreationInSecs
    }
    command {
        # Simulate the time the processes takes to finish
        timeToWait=\$(shuf -i ${processATimeRange} -n 1)
    }
}



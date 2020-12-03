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
        String taskATimeRange
        Int numberFilesFortaskA
        Int taskATimeBetweenFileCreationInSecs
    }
    command <<<
        # Simulate the time the task takes to finish
        timeToWait=$(shuf -i ~{taskATimeRange} -n 1)
        
        for i in {1..~{numberFilesFortaskA}}
        do
        echo test > file_${i}.txt
        sleep ~{taskATimeBetweenFileCreationInSecs}
        done
        sleep $timeToWait
    >>>
    output{
        Array[File] output_files = glob("*.txt")
    }
    runtime {
        docker:"ubuntu:18.10"
    }
}



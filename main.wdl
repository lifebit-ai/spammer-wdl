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
  call task_B {
      input:
      input_file = task_A.output_file_1
  }
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
        # Simulate the time the tasks takes to finish
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
        File output_file_1 = "file_1.txt"
    }
    runtime {
        docker:"quay.io/lifebitai/ubuntu:18.10"
    }
}



# -------
# Task B
# -------

task task_B {
    input {
        File input_file
        String taskBTimeRange
        Int processBWriteToDiskMb 
    }
    command <<<
    # Simulate the time the tasks takes to finish
    timeToWait=$(shuf -i ~{taskBTimeRange} -n 1)
    
    sleep \$timeToWait
    dd if=/dev/urandom of=newfile bs=1M count=~{processBWriteToDiskMb}
    >>>
    runtime {
        docker:"quay.io/lifebitai/ubuntu:18.10"
    }
}

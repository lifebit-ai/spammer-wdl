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

    input {
        Int numberRepetitionsFortaskA
    }

    Array[Int] scatter_range = range(numberRepetitionsFortaskA)
    
    scatter(i in scatter_range){
        call task_A
        call task_B {
            input:
            input_file = task_A.output_file_1
        }
        call task_C {
            input:
            input_file = task_A.output_file_2
        }
        call task_D {
            input:
            input_file = task_A.output_file_3
        }

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
        File output_file_1 = "file_1.txt"
        File output_file_2 = "file_2.txt"
        File output_file_3 = "file_3.txt"
    }
    runtime {
        docker: "quay.io/lifebitai/ubuntu:18.10"
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
    # Simulate the time the task takes to finish
    timeToWait=$(shuf -i ~{taskBTimeRange} -n 1)
    
    sleep $timeToWait
    dd if=/dev/urandom of=newfile bs=1M count=~{processBWriteToDiskMb}
    >>>
    runtime {
        docker: "quay.io/lifebitai/ubuntu:18.10"
    }
}



# -------
# Task C
# -------

task task_C {
    input {
        File input_file
        String taskCTimeRange
    }
    command <<<
    # Simulate the time the task takes to finish
    timeToWait=$(shuf -i ~{taskCTimeRange} -n 1)
    
    sleep $timeToWait
    >>>
    runtime {
        docker: "quay.io/lifebitai/ubuntu:18.10"
    }
}



# -------
# Task D
# -------

task task_D {
    input {
        File input_file
        String taskDTimeRange
    }
    command <<<
    # Simulate the time the task takes to finish
    timeToWait=$(shuf -i ~{taskDTimeRange} -n 1)
    
    sleep $timeToWait
    >>>
    runtime {
        docker: "quay.io/lifebitai/ubuntu:18.10"
    }
}



#!/bin/bash

# 检查初始的 POSCAR 文件是否存在
if [ ! -f POSCAR ]; then
    echo "Error: POSCAR does not exist in the current directory."
    exit 1
fi

# 循环四次提交VASP任务
for i in {1..4}
do
    # 提交VASP任务并获取作业ID
    jobid=$(sbatch --parsable ll.sub)

    # 等待当前作业完成
    echo "Waiting for job $jobid to complete..."
    while squeue -j $jobid | grep -q $jobid
    do
        sleep 120  # 每120秒检查一次任务是否运行完毕
    done

    echo "Job $jobid completed."

    # 作业完成后，复制CONTCAR为POSCAR，并重命名文件
    cp CONTCAR POSCAR
    mv CONTCAR "CONTCAR$i"
    mv OUTCAR "OUTCAR$i"
    mv XDATCAR "XDATCAR$i"
    mv OSZICAR "OSZICAR$i"

    echo "Iteration $i completed and files are saved."
done

echo "All VASP jobs have been submitted and completed."

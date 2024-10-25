#!/bin/bash

# 检查初始的 POSCAR 文件是否存在
if [ ! -f POSCAR ]; then
    echo "Error: POSCAR does not exist in the current directory."
    exit 1
fi

# 循环四次提交VASP任务
for i in {1..4}
do
    # 提交VASP任务
    sbatch ll.sub

    # 确认CONTCAR文件存在并复制为POSCAR，为下一次迭代做准备
    if [ -f CONTCAR ]; then
        cp CONTCAR POSCAR
    else
        echo "Warning: CONTCAR not found, using old POSCAR."
    fi

    echo "Iteration $i submitted."
    # 等待一段时间以确保作业系统开始处理前一个任务，例如等待10秒
    sleep 10
done

echo "All VASP jobs have been submitted."

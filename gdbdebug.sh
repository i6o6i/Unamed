#a bash script used for gdb debug(inside vim)
#!/bin/bash
filename="oj1164"
run=0
breakpoint=(52)
display=(
"i"
"j"
"visitedNum[i]"
"visitedNum[i]"
"visitedNumIndex"
"visitedNum[0]"
"visitedNum[1]"
"visitedNum[2]"
"Seqlist[i]->weight"
"Seqlist[index]->weight"
"Seqlist[0]->weight"
"Seqlist[1]->weight"
"Seqlist[2]->weight"
"Seqlist[3]->weight"
"Seqlist[4]->weight"
"index"
#"i->weight"
#"j->weight"
#"head->weight"
#"key->weight"
#"p->next->weight"
#"p->next->next->weight"
#"p->next->next->next->weight"
#"p->next->next->next->next->weight"
#"p->next->next->next->next->next->weight"
#"p->next->next->next->next->next->next->weight"
#"p->next->next->next->next->next->next->next->weight"
#"p->next->next->next->next->next>next->next->next->weight"
#"p->next->next->next->next->next->next>next>next->next->next->weight"
#"p->next->next->next->next->next->next>next>next->next->next->next->weight"
)                              
line=(
)

afterProI=(
"set pagination off"
)

afterProI=(r)
filename="E03"

rm -rf "GDB_$filename"
g++ -g "$filename.cpp" -o "GDB_$filename"

command="\n"
for i in ${breakpoint[@]};do
	command=$command"b $i\n"
done

i=0
programinput=""
while [ $i -lt ${#line[@]} ];do
	programinput=$programinput"${line[$i]}\n"
	((i++))
done
echo -e $programinput > input
command=$command"run < input\n\n"

i=0
while [ $i -lt ${#display[@]} ];do
	command=$command"display ${display[$i]}\n"
	((i++))
done

i=0
while [ $i -lt ${#afterProI[@]} ];do
	command=$command"${afterProI[$i]}\n"
	((i++))
done

if [ $run -eq 1 ]; then
    rm -f "./run_$filename"
    gcc "$filename.c" -o "run_$filename"
    "./run_$filename" < input
    #rm -f input "./run_$filename"
else
    echo "$command"
    rm -rf "GDB_$filename"
    gcc -g "$filename.c" -o "GDB_$filename"
    (echo -e "$command" && cat)|gdb "GDB_$filename"
    rm -rf "GDB_$filename"
fi

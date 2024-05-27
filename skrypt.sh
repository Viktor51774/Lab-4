#!/bin/bash
if [ "$1" = "--date" ] || [ "$1" = "-d"; then
date

if [ "$1" = "--logs" ] || [ "$1" = "-l"]; then
    count=${2:-100}

    mkdir -p logx

    for ((i=1; i<=$count; i++)); do
        echo "File: log$i.txt" > logx/log$i.txt
        echo "Created by: $0" >> logx/log$i.txt
        echo "Date: $(date)" >> logx/log$i.txt
    done

    echo "Created $count files in the logx directory."
    exit 0
fi

if [ $# -ne 1 ]; then
    echo "Usage: $0 --logs <number_of_files>"
    exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Number of files must be a positive integer"
    exit 1
fi

number_of_files=$1

for ((i=1; i<=$number_of_files; i++)); do
    filename="log$i.txt"
    touch $filename
    echo "File name: $filename" > $filename
    echo "Script name: $0" >> $filename
    echo "Creation date: $(date)" >> $filename
done

show_help() {
    echo "Pomoc:"
    echo "Użycie: skrypt.sh [OPCJE]"
    echo "Dostępne opcje:"
    echo "  --help       Wyświetla pomoc"
    echo "  -a, --option-a    Opcja A"
    echo "  -b, --option-b    Opcja B"
    # Dodaj więcej opcji, jeśli są dostępne
}

if [[ "$1" == "--help" ]] || [[ "$1" == "-h"]]; then
    show_help
    exit 0
fi

if [ "$1" = "--init" ]; then
    git clone https://github.com/AlinaRazumova/Lab4/tree/v1.0
    repo_dir="$(pwd)/repozytorium"
    echo "export PATH="$repo_dir:$PATH"" >> ~/.bashrc
    source ~/.bashrc
    echo "Repozytorium zostało sklonowane i ścieżka została dodana do PATH."
    exit 0
fi

echo "Usage: $0 --init"

if [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    count=${2:-100}
    mkdir -p errorx
    for ((i=1; i<=$count; i++)); do
        echo "File: error$i.txt" > errorx/error$i.txt
        echo "Created by: $0" >> errorx/error$i.txt
        echo "Date: $(date)" >> errorx/error$i.txt
    done

    echo "Created $count files in the errorx directory."
    exit 0
fi




^G Help          ^O Write Out     ^W Where Is      ^K Cut           ^T Execute       ^C Location      M-U Undo         M-A Set Mark     M-] To Bracket   M-Q Previous     ^B Back          ^◂ Prev Word
^X Exit          ^R Read File     ^\ Replace       ^U Paste         ^J Justify       ^/ Go To Line    M-E Redo         M-6 Copy         ^Q Where Was     M-W Next         ^F Forward       ^▸ Next Word


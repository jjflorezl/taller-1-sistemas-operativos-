#!/bin/bash
punto_6(){
valor=4.6
if [ $(echo "$valor > 4.5" | bc -l) ]; then
    echo "tu número es mayor a 4.5"
elif [ $(echo "$valor == 4.5" | bc -l) ]; then
    echo "tu número es igual a 4.5"
else
    echo "tu número es menor a 4.5"
fi
}
punto_7(){
    lista=(1 4 3 2 5 9 6 7 8 );
    max=${lista[0]}
    elemento=5
    cont=0;
    for i in "${lista[@]}"; do
        if ((i > max)); then
            max=$i
        fi
        if((i == elemento)); then
            echo "el numero $elemento se encuentra en el arreglo"
            cont+=1
        fi
    done
echo "El maximo es: $max y el numero 5 se encontro $cont veces"
ordenado=($(printf "%s\n" "${lista[@]}" | sort -n))
echo "Arreglo ordenado: ${ordenado[@]}"


}
punto_8(){
    read -p "nombre de la carpeta: " carpeta
    mkdir -p "$carpeta"
    read -p "ingrese la cantidad de subcarpetas: " x
    for ((i=1; i<=x; i++)); do
    subcarpeta="$carpeta/subcarpeta_$i"
    mkdir -p "$subcarpeta"
    archivo="$subcarpeta/${RANDOM}.txt"
    echo "Este es el archivo aleatorio" > "$archivo"

done

echo "Se creó la carpeta '$carpeta' con $x subcarpetas."
}
punto_8_segunda_parte(){
    for sub in "$carpeta"/subcarpeta_*; do #el dato hola puede ser remplazado por el nombre de la carpeta introducida en la funcion anterior
    for file in "$sub"/*.txt; do
        nombre=$(basename "$file" .txt)   
        if (( nombre % 2 == 0 )); then    
            nuevo=$((nombre + 1))         
            mv "$file" "$sub/$nuevo.txt"
            echo "Archivo $nombre.txt renombrado a $nuevo.txt"
        fi
    done
done
}
punto_9a(){
    carpeta=$1
for archivo in "$carpeta"/*; do
    if [ -f "$archivo" ]; then
        tamano=$(du -h "$archivo" | cut -f1)
        echo "Archivo: $(basename "$archivo") → Tamaño: $tamano"
    fi
done
}
punto_9b(){
    carpeta=$1
    for subcarpeta in "$carpeta"/*; do
    if [ -d "$subcarpeta" ]; then
        cantidad_archivos=$(find "$subcarpeta" -type f | wc -l)
        echo "Subcarpeta: $(basename "$subcarpeta") → Archivos: $cantidad_archivos"
    fi
done
total_subcarpetas=$(find "$carpeta" -mindepth 1 -type d | wc -l)
echo "Cantidad total de subcarpetas: $total_subcarpetas"
}
punto_9c(){
    carpeta=$1
tar -czvf "${carpeta}.tar.gz" "$carpeta"
echo "Carpeta comprimida en: ${carpeta}.tar.gz"
}
punto_9d(){
    carpeta=$1
find "$carpeta" -type f -mtime -1
}
punto_9e(){
    carpeta=$1
tamano=$2

resultado=$(find "$carpeta" -type f -size +"${tamano}M")
if [ -z "$resultado" ]; then
    echo "ningun comando es mas grande que $tamano megas"
else
    echo "los archivos con mas de $tamano megas en $carpeta son: "
    echo "$resultado"
fi
}
punto_9e hola 1
#recordar que las funciones desde la 8 segunda parte se le deben enviar parametros
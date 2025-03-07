Ejercicio 1

1. ¿Qué comando utilizaste en el paso 11? ¿Por qué?

El comando utilizado fue *git reset --hard HEAD~1* porque permite deshacer el último commit eliminando los cambios del working copy.

2. ¿Qué comando o comandos utilizaste en el paso 12? ¿Por qué?

Primero he usado *git reflog*, para ver el commit  (99f4b09) que acabamos de deshacer, y a continuación he usado *git reset –hard 99f4b09*, porque este comando vuelve al estado anterior al repositorio, es decir, rehace el commit que ha sido deshecho.

3. El merge del paso 13, ¿Causó algún conflicto? ¿Por qué?

El merge no causó conflictos porque no hay cambios superpuestos en el archivo entre las dos ramas.

4. El merge del paso 19, ¿Causó algún conflicto? ¿Por qué?

Sí hay conflicto porque ambas ramas tienen cambios en el mismo archivo y en las mismas líneas.

5. El merge del paso 21, ¿Causó algún conflicto? ¿Por qué?

No ha causado ningún conflicto porque no había cambios superpuestos en el archivo entre las dos ramas

6. ¿Qué comando o comandos utilizaste en el paso 25?

He usado *git log --graph –decorate* que dibuja un gráfico ASCII que muestra la estructura de ramas y merges en tu historial de commits. --decorate añade información adicional a cada commit en el log, como el nombre de las ramas, tags y otras referencias.

7. El merge del paso 26, ¿Podría ser fast forward? ¿Por qué?

El merge podría haber sido fast-forwad ya que “main “no ha tenido nuevos cambios desde que se creo “title”, los commits de “title” son una continuación directa de los commits de “main”.

8. ¿Qué comando o comandos utilizaste en el paso 27?

He usado *git reset HEAD~1*, para deshacer el merge sin perder los cambios en mi working copy.

9. ¿Qué comando o comandos utilizaste en el paso 28?

He usado *git checkout – git-nuestro.md*

10. ¿Qué comando o comandos utilizaste en el paso 29?

He usado *git branch -D title*, ya que title no estaba fusionada con main.

11. ¿Qué comando o comandos utilizaste en el paso 30?

Con *git reflog* he buscado el commit (89abfa2) de dicho merge  “no fast-forward” de “title” en “main”, y a continuación he usado el comando *git merge 89abfa2* para rehacerlo.

12. ¿Qué comando o comandos usaste en el paso 32?

He usado primero *git reflog* para buscar el commit inicial (e770639), y a continuación *git checkout e770639*, para volver al commit inicial “Añadir git-nuestro.md”.

13. ¿Qué comando o comandos usaste en el punto 33?

Primero *git reflog* para buscar el commit (e3386f0), y  a continuación *git checkout e3386f0*, para moverme al commit final “Añadir título”.





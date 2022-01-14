[![Downloads][downloads-shield]][downloads-url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
[![GitHub followers][github-shield]][github-url]

<h1 align="center">ROQuiz</h1>
Applicazione grafica Java per esercitarsi con i <b>quiz del corso Ricerca Operativa M</b>.
È possibile caricare un file con le varie domande (aggiornate al <i>15 luglio 2021</i>) divise per argomento, quindi si possono inserire eventuali domande nuove o personalizzate, ed è possibile selezionare gli argomenti di interesse; terminato il quiz vengono mostrate le risposte corrette e quelle sbagliate.
il numero di domande di default è 16, così come il timer è impostato a 18 minuti in quanto l'esame è in questa forma, ma è possibile modificare questi parametri nelle impostazioni dell'applicazione.

Chiunque voglia <a href="#contribuire">contribuire</a> è liberissimo di fare una fork e aggiungere e implementare feature nuove o sistemare parti del codice già esistente.

L'obbiettivo dell'applicazione è esercitarsi coi quiz dopo aver studiato la teoria (molto meglio se dal libro, in quanto è completo ed esaustivo). <b>Non mi assumo responsabilità di alcun tipo nel caso di errori nelle domande o nelle risposte, né tantomento nel caso di bocciature potenti</b>. Fatene un buon uso e buona fortuna con l'esame <3

### Demo

#### Desktop
<table style="border: none">
  <tr>
    <td width="49.9%"><img src="https://github.com/mikyll/ROQuiz/blob/main/gfx/[GIF] DesktopEndQuiz.gif" alt="EndQuizGIF"/></td>
    <td width="49.9%"><img src="https://github.com/mikyll/ROQuiz/blob/main/gfx/[GIF] DesktopTimeout.gif" alt="TimeoutGIF"/></td>
  </tr>
  <tr>
    <td align="center">Terminazione quiz</td>
    <td align="center">Tempo scaduto</td>
  </tr>
</table>

#### Mobile
<table style="border: none">
  <tr>
    <td width="49.9%"><img width=50% src="https://github.com/mikyll/ROQuiz/blob/main/gfx/[GIF] MobileInstall.gif" alt="InstallMobileGIF"/></td>
    <td width="49.9%"><img width=50% src="https://github.com/mikyll/ROQuiz/blob/main/gfx/[GIF] MobileUsage.gif" alt="MobileUsageGIF"/></td>
  </tr>
  <tr>
    <td align="center">Installazione versione mobile</td>
    <td align="center">Terminazione quiz</td>
  </tr>
</table>

### Esecuzione

#### Versione Desktop (Windows e Linux)
1. Scaricare l'[ultima release](https://github.com/mikyll/ROQuiz/releases/latest) ([Windows](https://github.com/mikyll/ROQuiz/releases/download/v1.2/ROQuizDeployWindows.zip) o [Linux](https://github.com/mikyll/ROQuiz/releases/download/v1.2/ROQuizDeployLinux.tar.gz)) ed estrarre il contenuto.
2. Eseguire Launcher con doppioclick.

#### Versione Mobile (Android)
1. Scaricare l'[apk](https://github.com/mikyll/ROQuiz/releases/download/v1.3-mobile_beta/roquiz_v1.3-mobile_beta.apk).
2. Selezionare ```INSTALLA``` e ```INSTALLA COMUNQUE```.

### Formattazione domande
Le domande sono caricate da un file "<a href="https://github.com/mikyll/ROQuiz/blob/main/Domande.txt">Domande.txt</a>" che ha il seguente formato:
* (opzionale) Argomenti:
  - la riga di un argomento inizia col carattere speciale '@', seguito dal nome dell'argomento. Ogni riga di argomento è seguita dalle domande relative a quell'argomento, fino all'argomento successivo. Alla fine della riga dell'argomento possono essere usati caratteri non alfabetici (ad esempio '=') per separare visivamente le domande di argomenti differenti (tali caratteri verranno ignorati).
* Domande: 
  - una riga per la domanda;
  - 5 righe per le risposte (la riga inizia con una lettera maiuscola, seguita da un punto e dalla risposta);
  - una riga per la risposta corretta (una lettera da A a E);
  - una riga vuota se non è l'ultima domanda (questa riga separa la domanda da quella successiva, o dall'argomento successivo).

NB: non è importante la lettera con cui iniziano le risposte, basta che siano in ordine, altrimenti la risposta giusta e la lettera non corrispondono.

esempio (tre domande di due argomenti diversi nel file Domande.txt):
<pre>
@Programmazione Matematica =============================================================================
Dato un insieme F, un intorno è
A. L'insieme di tutti i sottoinsiemi di F
B. L'insieme dei punti di F a distanza minore di epsilon da un punto x di F
C. Una funzione N: F -> 2^F
D. Una combinazione convessa di due punti x e y di F
E. Nessuna di queste
C

@Dualità ===============================================================================================
Se un problema di programmazione lineare (primale) ha soluzione ottima finita, allora:
A. Il suo duale non è detto che abbia soluzione ottima finita.
B. Anche il suo duale ha soluzione ottima finita e i valori delle soluzioni coincidono.
C. Anche il duale ha soluzione ottima finita, ma non è detto che i valori delle soluzioni coincidano.
D. Anche il duale ha soluzione ottima finita, ma i valori delle due soluzioni non coincidono.
E. Nessuna di queste
B

Quale tra queste affermazioni è falsa rispetto ad una corrispondenza primale-duale?
A. Ai costi corrispondono condizioni su variabili e viceversa.
B. I vincoli sono dati dalle righe di A per il primale, dalle colonne di A per il duale.
C. Ai costi corrispondono i termini noti e viceversa.
D. Ad un vincolo corrisponde una condizione su una variabile e viceversa.
E. Nessuna di queste.
A
</pre>

### Contribuire
Aggiunta domande o feature al progetto:
1. Fare una **fork** della repository.
2. Clonare la repository in locale.
3. (Opzionale) Creare un nuovo branch.
4. Aggiungere le modifiche:
  * Per aggiungere nuove domande: modificare il file 'Domande.txt', inserendo le nuove domande sotto gli argomenti relativi. NB: in caso non si sappia sotto quale argomento inserire una somanda, scriverlo successivamente in un commento nella pull request.<br/>
  * Per aggiungere delle feature, basta implementarle e integrarle col resto dell'applicazione (in caso di dubbi o domande sul funzionamento di alcune parti di codice, basta aprire un issue e cercherò di rispondere il prima possibile).
5. Fare commit e push.
6. Creare una **pull request** aggiungendo informazioni se necessario.

Proposta feature:
1. Aprire un issue spiegando in cosa consiste la feature da aggiungere.
2. Possibilmente aggiungervi la label "enhancement".

### Roadmap
Features da aggiungere e sviluppi futuri:
- [x] aggiungere la scelta degli argomenti
- [ ] fare il porting su mobile
  - [x] [Android](https://github.com/mikyll/ROQuiz/releases/tag/v1.3-mobile_beta)
  - [ ] iOS
- [ ] deploy su MacOS
- [ ] aggiungere file di configurazione (xml o JSON) per rendere le modifiche alle impostazioni persistenti
- [ ] aggiungere test domande duplicate
- [ ] verifica aggiornamenti(?)
- [ ] creare tool per inserire domande nuove (che sfrutta il test per le domande duplicate)
- [ ] desktop: aggiungere impostazione dark mode ([riferimento utile](https://stackoverflow.com/questions/49159286/make-a-dark-mode-with-javafx))
- [ ] mobile: fare refactor e sistemare le classi (usare classe Quiz)
- [ ] mobile: aggiungere scelta argomenti
- [ ] mobile: aggiungere possibilità di caricare un file domande personalizzato

### Built With
Per l'implementazione ho utilizzato Java 11 e JavaFX 11, come IDE Eclipse (versione 2020-03 (4.15.0)), e SceneBuilder per la creazione della grafica (file FXML). Vedere i passi seguiti per il [setup del progetto](https://github.com/mikyll/ROQuiz/blob/main/Project%20Setup.md).

versione Java: JavaSE-11 (jdk-11.0.11)<br/>
versione JavaFX: JavaFX 11 (javafx-sdk-11.0.2)

### Riferimenti
* Guida a classe Timeline usata per realizzare il countdown: [Timers in JavaFX and ReactFX](https://tomasmikula.github.io/blog/2014/06/04/timers-in-javafx-and-reactfx.html)
* Lavorare coi moduli Java: [Java 9 Modules in Eclipse](https://blogs.oracle.com/java/post/how-to-develop-modules-with-eclipse-ide)
* Creare jre custom con JavaFX (jlink): [Custom jre with JavaFX 11](https://stackoverflow.com/questions/52966195/custom-jre-with-javafx-11) e [How to use jlink to create a Java image with javafx modules](https://github.com/javafxports/openjdk-jfx/issues/238)
* JavaFX ottenere HostService senza riferimento alla classe Application (Main extends Application): [Open a link in a browser without reference to Application](https://stackoverflow.com/questions/33094981/javafx-8-open-a-link-in-a-browser-without-reference-to-application)


[downloads-shield]: https://img.shields.io/github/downloads/mikyll/ROQuiz/total
[downloads-url]: https://github.com/mikyll/ROQuiz/releases/latest
[contributors-shield]: https://img.shields.io/github/contributors/mikyll/ROQuiz
[contributors-url]: https://github.com/mikyll/ROQuiz/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/mikyll/ROQuiz
[forks-url]: https://github.com/mikyll/ROQuiz/network/members
[stars-shield]: https://img.shields.io/github/stars/mikyll/ROQuiz
[stars-url]: https://github.com/mikyll/ROQuiz/stargazers
[issues-shield]: https://img.shields.io/github/issues/mikyll/ROQuiz
[issues-url]: https://github.com/mikyll/ROQuiz/issues
[license-shield]: https://img.shields.io/github/license/mikyll/ROQuiz
[license-url]: https://github.com/mikyll/ROQuiz/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?logo=linkedin&colorB=0077B5
[linkedin-url]: https://www.linkedin.com/in/michele-righi/?locale=it_IT
[github-shield]: https://img.shields.io/github/followers/mikyll.svg?style=social&label=Follow
[github-url]: https://github.com/mikyll

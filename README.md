<div align="center">

[![Downloads][downloads-shield]][downloads-url]
[![Domande][domande-shield]][domande-url]
[![Stargazers][stars-shield]][stars-url]
[![Contributors][contributors-shield]][contributors-url]
[![MIT License][license-shield]][license-url]
[![Issues][issues-shield]][issues-url]
<br />
[![dart][dart-shield]][dart-url]
[![flutter][flutter-shield]][flutter-url]

<h1>DMQuiz</h1>
<h3>Applicazione multipiattaforma per esercitarsi con i quiz del corso <a href="https://www.unibo.it/it/didattica/insegnamenti/insegnamento/2022/468022">Data Mining M</a>.</h3>
<hr class="rounded">
</div>

### Versioni Disponibili
- Desktop (Windows, Linux e MacOS)
- Mobile (Android)

### Funzionalità
- L'app **simula un quiz d'esame**, pescando in modo casuale delle domande a risposta multipla a cui l'utente deve rispondere entro il tempo limite definito da un timer.
- Pool di <span id="domande">69+</span> domande differenti, divise per argomento.
- Possibilità di scelta di argomenti specifici per le domande da includere nel quiz.
- Possibilità di personalizzare le impostazioni dell'app in modo persistente:
  - Scelta di un numero specifico di domande (default: 10, selezionate casualmente).
  - Modifica del tempo a disposizione per il quiz (default: 10 minuti).
  - Controllo all'avvio dell'app se nella repository sono presenti nuove domande.
  - Scelta del tema (chiaro/scuro)
- Possibilità di inserimento di domande personalizzate (modificando il file Domande.txt e rispettando le regole di [formattazione](#formattazione-domande)).

<!--
### Demo
#### Desktop
<table style="border: none">
  <tr align="center">
    <td><img src="./gfx/[GIF] DesktopEndQuiz.gif" alt="EndQuizGIF"/></td>
    <td><img src="./gfx/[GIF] DesktopTimeout.gif" alt="TimeoutGIF"/></td>
  </tr>
  <tr align="center">
    <td>Terminazione quiz</td>
    <td>Tempo scaduto</td>
  </tr>
</table>

#### Mobile
<table style="border: none">
  <tr align="center">
    <td><img width=50% src="./gfx/[GIF] MobileDemo.gif" alt="DemoMobileGIF"/></td>
    <td><img width=50% src="./gfx/[GIF] MobileQuestionList.gif" alt="QuestionListGIF"/></td>
    <td><img width=50% src="./gfx/[GIF] MobileSettings.gif" alt="SettingsMobileGIF"/></td>
  </tr>
  <tr align="center">
    <td>Demo Quiz</td>
    <td>Lista Domande</td>
    <td>Impostazioni</td>
  </tr>
</table>-->

### Download
#### Versione Desktop
1. Scaricare l'[ultima release](https://github.com/TryKatChup/DMQuiz/releases/latest) ([Windows](), [Linux]() o [MacOS]()) ed estrarre il contenuto.
2. Eseguire Launcher con doppio click.

#### Versione Mobile
1. Scaricare l'[apk]().
2. Selezionare ```INSTALLA``` e ```INSTALLA COMUNQUE```.

### Formattazione domande
Le domande sono caricate da un file "<a href="./Domande.txt">Domande.txt</a>" che ha il seguente formato:
* (opzionale) Argomenti:
  - la riga di un argomento inizia col carattere speciale '@', seguito dal titolo dell'argomento (es: Complessità). Ogni riga di argomento è seguita dalle domande relative a quell'argomento, fino all'argomento successivo. Alla fine della riga dell'argomento possono essere usati caratteri non alfabetici (ad esempio '=') per separare visivamente le domande di argomenti differenti (tali caratteri verranno ignorati).
* Domande: 
  - una o più righe per la domanda (in caso di domanda multilinea è necessario aggiungere il carattere di newline '\n' al termine di tutte le righe della domanda, tranne l'ultima);
  - 4 o 5 righe per le risposte (la riga inizia con una lettera maiuscola, seguita da un punto e dalla risposta);
  - una riga per la risposta corretta (una lettera da A a E);
  - una riga vuota se non è l'ultima domanda (questa riga separa la domanda da quella successiva, o dall'argomento successivo).

NB: non è importante la lettera con cui iniziano le risposte, basta che siano in ordine, altrimenti la risposta giusta e la lettera non corrispondono.

esempio (tre domande di due argomenti diversi nel file Domande.txt):
<pre>
@Machine Learning ======================================================================================
Which of the following types of data allows the use of the euclidean distance?
A. Points in a vector space
B. Ordered data
C. Transactional data
D. Document representations
A

Given the two binary vectors below, which is their similarity according to the Jaccard Coefficient?\n
a b c d e f g h i j\n
1 0 0 0 1 0 1 1 0 1\n
1 0 1 1 1 0 1 0 1 0
A. 0.1
B. 0.2
C. 0.5
D. 0.375
D

@Data Mining ===========================================================================================
Which of the definition below describes the OLAP operation "Pivot"?
A. Causes an increase in data aggregation and removes a detail level in a hierarchy
B. Reduces data aggregation and adds a detail level to a hierarchy
C. Changes the layout, in order to analyse a group of data from a different viewpoint
D. Creates a link between concepts in interrelated cubes, to compare them
E. Reduces the number of cube dimensions after setting one of the dimensions to a specific value
C
</pre>

### Contribuire
Aggiunta domande o feature al progetto:
1. Fare una **fork** della repository.
2. Clonare la repository in locale.
3. (Opzionale) Creare un nuovo branch.
4. Aggiungere le modifiche:
  * Per aggiungere nuove domande: modificare il file 'Domande.txt', inserendo le nuove domande sotto gli argomenti relativi. NB: in caso non si sappia sotto quale argomento inserire una domanda, scriverlo successivamente in un commento nella pull request.<br/>
  * Per aggiungere delle feature, basta implementarle e integrarle col resto dell'applicazione.
5. Fare commit e push.
6. Creare una **pull request** aggiungendo informazioni se necessario.
7. Ammirare il proprio nome inserito in questa meravigliosa lista che viene aggiornata automaticamente.

Proposta feature:
1. Aprire un issue spiegando in cosa consiste la feature da aggiungere.
2. Possibilmente aggiungervi la label "enhancement".

#### Contributors Attuali
<!-- readme: contributors -start -->
<table>
<tr>
    <td align="center">
        <a href="https://github.com/TryKatChup">
            <img src="https://avatars.githubusercontent.com/u/39459803?v=4" width="100;" alt="TryKatChup"/>
            <br />
            <sub><b>TryKatChup</b></sub>
        </a>
    </td>
    <td align="center">
        <a href="https://github.com/mikyll">
            <img src="https://avatars.githubusercontent.com/u/56556806?v=4" width="100;" alt="mikyll"/>
            <br />
            <sub><b>mikyll</b></sub>
        </a>
    </td>
    <td align="center">
        <a href="https://github.com/Noesh">
            <img src="https://avatars.githubusercontent.com/u/56556129?v=4" width="100;" alt="Noesh"/>
            <br />
            <sub><b>Noesh</b></sub>
        </a>
    </td></tr>
</table>
<!-- readme: contributors -end -->

### Built With
#### Mobile
Per l'implementazione dell'app mobile ho utilizzato Flutter, come IDE Visual Studio Code (versione 1.72.2).

versione Flutter: 3.3.8<br/>
versione Dart: 2.18.4

### Disclaimer
L'obiettivo dell'applicazione è esercitarsi coi quiz. <b>Non mi assumo responsabilità di alcun tipo nel caso di errori nelle domande o nelle risposte, né tantomento nel caso di bocciature potenti</b>. Fatene un buon uso e buona fortuna con l'esame <3

### Riferimenti
* [Ciclo di vita](https://docs.oracle.com/javase/8/javafx/api/javafx/application/Application.html) della classe Application
* Guida a classe Timeline usata per realizzare il countdown: [Timers in JavaFX and ReactFX](https://tomasmikula.github.io/blog/2014/06/04/timers-in-javafx-and-reactfx.html)
* Lavorare coi moduli Java: [Java 9 Modules in Eclipse](https://blogs.oracle.com/java/post/how-to-develop-modules-with-eclipse-ide)
* Creare jre custom con JavaFX (jlink): [Custom jre with JavaFX 11](https://stackoverflow.com/questions/52966195/custom-jre-with-javafx-11) e [How to use jlink to create a Java image with javafx modules](https://github.com/javafxports/openjdk-jfx/issues/238)
* JavaFX ottenere HostService senza riferimento alla classe Application (Main extends Application): [Open a link in a browser without reference to Application](https://stackoverflow.com/questions/33094981/javafx-8-open-a-link-in-a-browser-without-reference-to-application)
* Soluzione per eccezione SSL handshake: [SSLHandshakeException: Received fatal alert: handshake_failure](https://stackoverflow.com/questions/54770538/received-fatal-alert-handshake-failure-in-jlinked-jre)
* Gestione dei moduli (ad esempio Gson): [InaccessibleObjectException ("Unable to make {member} accessible: module {A} does not 'opens {package}' to {B}")](https://stackoverflow.com/questions/41265266/how-to-solve-inaccessibleobjectexception-unable-to-make-member-accessible-m)
* [JavaFX CSS Docs](https://docs.oracle.com/javafx/2/api/javafx/scene/doc-files/cssref.html)
* [Fix puntini bianchi](https://stackoverflow.com/questions/44169273/javafx-unwanted-white-corner-textarea) negli angoli della TextArea, usando il tema scuro
* [StackOverflow GitHub latest version](https://stackoverflow.com/questions/34745526/java-get-latest-github-release)
* [Richieste HTTP con java.net](https://www.baeldung.com/java-http-response-body-as-string)
* [Using jlink to Build Java Runtimes for non-Modular Applications](https://medium.com/azulsystems/using-jlink-to-build-java-runtimes-for-non-modular-applications-9568c5e70ef4)
* [Download asset Flutter](https://pub.dev/packages/download_assets)
* [LongPress Widget](https://stackoverflow.com/questions/52128572/flutter-execute-method-so-long-the-button-pressed)

<div align="center">
  
  <br/><br/>
  <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.
  
[![LinkedIn][linkedin-shield]][linkedin-url]
[![GitHub followers][github-shield]][github-url]

</div>

[downloads-shield]: https://img.shields.io/github/downloads/TryKatChup/DMQuiz/total
[downloads-url]: https://github.com/TryKatChup/DMQuiz/releases/latest
[contributors-shield]: https://img.shields.io/github/contributors/TryKatChup/DMQuiz
[contributors-url]: https://github.com/TryKatChup/DMQuiz/graphs/contributors
[domande-shield]: https://img.shields.io/static/v1?label=domande&message=93&color=green
[domande-url]: https://github.com/TryKatChup/DMQuiz/blob/main/Domande.txt
[forks-shield]: https://img.shields.io/github/forks/TryKatChup/DMQuiz
[forks-url]: https://github.com/TryKatChup/DMQuiz/network/members
[repo-size-shield]: https://img.shields.io/github/repo-size/TryKatChup/DMQuiz
[repo-size-url]: https://img.shields.io/github/repo-size/TryKatChup/DMQuiz
[total-lines-shield]: https://img.shields.io/tokei/lines/github/TryKatChup/DMQuiz
[total-lines-url]: https://img.shields.io/tokei/lines/github/TryKatChup/DMQuiz
[pull-request-shield]: https://img.shields.io/github/issues-pr/TryKatChup/DMQuiz
[pull-request-url]: https://img.shields.io/github/issues-pr/TryKatChup/DMQuiz
[stars-shield]: https://img.shields.io/github/stars/TryKatChup/DMQuiz
[stars-url]: https://github.com/TryKatChup/DMQuiz/stargazers
[issues-shield]: https://img.shields.io/github/issues/TryKatChup/DMQuiz
[issues-url]: https://github.com/TryKatChup/DMQuiz/issues
[license-shield]: https://img.shields.io/badge/License-CC_BY--NC--SA_4.0-lightgrey.svg
[license-url]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[dart-shield]: https://img.shields.io/badge/Dart-%230175C2.svg?logo=dart&logoColor=white
[dart-url]: https://dart.dev/
[flutter-shield]: https://img.shields.io/badge/Flutter-%2302569B.svg?logo=Flutter&logoColor=white
[flutter-url]: https://flutter.dev/
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?logo=linkedin&colorB=0077B5
[linkedin-url]: https://www.linkedin.com/in/michele-righi/?locale=it_IT
[github-shield]: https://img.shields.io/github/followers/mikyll.svg?style=social&label=Follow
[github-url]: https://github.com/mikyll

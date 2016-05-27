Ce projet est parytagé en 2 parties:<br/>
    -> <b>HIGH LEVEL</b> : Contient les dossiers contenant le code JAVA pour les actions de haut niveau (interface utilisateur)<br/>
	-> <b>HIGH LEVEL/Camera</b> : Contient le code de reconnaissance de couleur (pas de documentation)<br/>
	-> <b>HIGH LEVEL/RobLip6</b> : Contient les codes d'intégration (Pour l'instant juste la communication avec le LOW LEVEL)<br/>
	-> <b>HIGH LEVEL/roblip6</b> : Contient la javadoc des codes d'intégration<br/>
	-> <b>HIGH_LEVEL/JAVA_TCP</b> : Contient les codes de communication ethernet (ancienne version avec le microcontroleur MBED)<br/>
	-> LOW LEVEL : code VHDL destiné à la carte MOJO V3 (gestion des capteurs)<br/>
    -> <b>LOW_LEVEL/firmware_IMU</b> : Contient le code arduino du firmware de l'IMU (modification nécessaire pour récupérer directement des quaternions à la place des angles d'Euler).<br/>
	-> <b>FPGA</b> : Contient le code (VHDL) nécessaire pour programmer le FPGA (Carte MOJO dans notre cas)<br/>
	-> <b>MBED</b> : Contient le code (C++) nécessaire pour programmer le microcontroleur MBED (plan B) <br/>
	-> <b>RobLip6</b> : Contient le design (EAGLE) du circuit imprimé pour la solution FPGA <br/>
Bonne lecture!

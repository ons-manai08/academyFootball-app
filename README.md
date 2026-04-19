⚽ Academy Football
Application Mobile de Gestion d’Académie Sportive

📌 Présentation du Projet
Academy Football est une application mobile dédiée à la gestion intelligente d’une académie de football.

Elle permet de centraliser toutes les interactions entre les différents acteurs : administrateurs, coachs, parents, joueurs et visiteurs.

Le système vise à améliorer :

* La communication en temps réel
* La gestion des équipes et des entraînements
* Le suivi des joueurs
* L’organisation des événements sportifs

L’objectif principal est de proposer une plateforme moderne, intuitive et évolutive adaptée aux besoins des académies sportives.

---

🏗️ Architecture Générale

L’application repose sur une architecture moderne :

Application Mobile (Flutter)
↓
Backend REST API (Spring Boot)
↓
Base de Données (MySQL)

🔹 Frontend

* Flutter (Dart)
* Interface mobile intuitive
* Communication via API REST
* Gestion des sessions

🔹 Backend

* Spring Boot
* Spring Security
* API REST
* Architecture en couches (Controller / Service / Repository)
* Gestion des rôles et authentification

---

✨ Fonctionnalités Principales

Le système repose sur une gestion des rôles (RBAC – Role-Based Access Control).

👑 Administrateur (Admin)
Responsable de la gestion globale de l’application.

🔹 Fonctionnalités :

* Ajouter et gérer les profils
* Gérer les équipes
* Partager et publier des événements
* Superviser le système

---

🏃‍♂️ Coach
Responsable des activités sportives et du suivi des joueurs.

🔹 Fonctionnalités :

* Gérer les programmes d’entraînement
* Planifier les matchs
* Communiquer avec les parents et les joueurs
* Consulter les équipes

---

👨‍👩‍👧 Parent
Acteur clé dans le suivi des joueurs.

🔹 Fonctionnalités :

* Suivre les programmes d’entraînement
* Discuter avec les coachs
* Suivre les informations liées à son enfant

---

🧒 Joueur
Utilisateur principal de l’académie.

🔹 Fonctionnalités :

* Consulter les plannings d’entraînement et des matchs
* Suivre les programmes
* Discuter en temps réel avec le coach et les autres joueurs

---

👀 Visiteur
Utilisateur non authentifié.

🔹 Fonctionnalités :

* Consulter les informations de l’académie
* S’inscrire (parent / joueur)

---

🔐 Authentification & Sécurité

* Inscription et connexion (parents & joueurs)
* Gestion sécurisée des profils
* Protection des accès
* Gestion des rôles (Admin / Coach / Parent / Joueur)

---

💬 Communication

* Messagerie en temps réel
* Interaction entre coachs, joueurs et parents

---

⚙️ Installation et Configuration

🖥️ Backend – Spring Boot

Prérequis :

* Java 17+
* Maven
* MySQL

Installation :
git clone https://github.com/votre-username/academy-football-backend.git
cd academy-football-backend
mvn clean install
mvn spring-boot:run

---

📱 Frontend – Flutter

Prérequis :

* Flutter SDK
* Android Studio ou VS Code

Installation :
git clone https://github.com/votre-username/academy-football-mobile.git
cd academy-football-mobile
flutter pub get
flutter run

---

🎨 UX/UI
L’interface a été conçue selon :

* Simplicité
* Navigation fluide
* Expérience utilisateur optimisée
* Design mobile moderne

---

🚀 Objectifs & Apports

* Digitalisation d’une académie sportive
* Amélioration de la communication interne
* Organisation optimisée des entraînements et matchs
* Plateforme évolutive et maintenable

---

📊 Perspectives d’Amélioration

* Notifications push
* Tableau de bord analytique
* Version web
* Intégration IA (analyse de performance)
* Déploiement cloud

---

👨‍🎓 Cadre Académique
Projet réalisé dans le cadre d’un projet de fin d’études

---

📄 Licence
Projet académique – Usage éducatif

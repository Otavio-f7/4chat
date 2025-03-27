# 4chat: Plataforma de Chat em Tempo Real com Firebase

## Descrição

O 4chat é uma plataforma de chat em tempo real desenvolvida com o objetivo de fornecer uma comunicação eficiente e segura, utilizando os serviços do Firebase. Este projeto demonstra a implementação de funcionalidades essenciais de um aplicativo de chat, incluindo troca de mensagens, gerenciamento de usuários e comunicação em tempo real, tudo integrado ao Firebase.

## Funcionalidades

* **Comunicação em Tempo Real (Firebase Firestore):** Utiliza o Firebase Firestore para permitir a troca de mensagens instantânea entre usuários, com sincronização em tempo real dos dados.
* **Gerenciamento de Usuários (Firebase Authentication):** Implementa um sistema de autenticação completo utilizando o Firebase Authentication para registrar, autenticar e gerenciar usuários de forma segura.
* **Troca de Mensagens (Firebase Firestore):** Permite que os usuários enviem e recebam mensagens de texto em tempo real, armazenadas e sincronizadas no Firestore.
* **Histórico de Mensagens (Firebase Firestore):** Armazena o histórico de mensagens no Firestore, permitindo que os usuários vejam conversas anteriores.
* **Notificações Push (Firebase Messaging):** Permite o envio de notificações push para usuarios.
* **Envio de notificações com Firebase Messaging:** As notificações são enviadas através do Firebase Messaging.

## Bibliotecas/Pacotes Utilizados

* `image_picker`
* `provider`
* `cloud_firestore`
* `firebase_auth`
* `firebase_core`
* `firebase_storage`
* `firebase_messaging`

## Instalação

1.  Clone este repositório: `git clone https://github.com/Otavio-f7/4chat.git`
2.  Navegue até o diretório do projeto: `cd 4chat`
3.  Instale as dependências do Flutter: `flutter pub get`
4.  Configure o Firebase:
    * Crie um projeto no [Firebase Console](https://console.firebase.google.com/).
    * Adicione o aplicativo Flutter ao seu projeto Firebase.
    * Baixe o arquivo `google-services.json` (para Android) ou `GoogleService-Info.plist` (para iOS) e coloque-o na pasta `android/app` ou `ios/Runner`, respectivamente.
    * Configure as dependências do Firebase no `pubspec.yaml`.
5.  Execute o aplicativo: `flutter run`

## Contribuição

Contribuições são bem-vindas! Se você encontrar bugs ou tiver sugestões de melhorias, abra uma issue ou envie um pull request.

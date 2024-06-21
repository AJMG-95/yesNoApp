/*
Entidad local con la que se trabaja dentro de la aplicación,
sirve como una capa extra para proteger la app de cambios en la
respuesta de la api que conllevaría cambios en el modelo.
Así pues un ante cambio en la espuesta de la api solo habria
que modificar el modelo
*/
enum FromWho { me, other }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}

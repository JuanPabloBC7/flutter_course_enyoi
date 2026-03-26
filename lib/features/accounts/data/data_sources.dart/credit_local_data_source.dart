class CreditLocalDataSource {
  int getPayCapacity({required String userName}) {
    // Aquí iría la lógica para obtener la capacidad de pago del usuario
    // Por ejemplo, podrías hacer una consulta a una base de datos local o a un servicio de almacenamiento
    // Luego, podrías devolver la capacidad de pago como un número
    return 60000; // Ejemplo de capacidad de pago
  }
}

int calculateCreditAmount({required int score, required int payCapacity}) {
  if (score > 700 && payCapacity > 50000) {
    return (payCapacity * 0.2).toInt(); // Monto aprobado
  } else {
    return 0; // Crédito denegado
  }
}

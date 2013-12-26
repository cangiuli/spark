void setup() {

  Spark.function("digitalread", tinkerDigitalRead);
  Spark.function("digitalwrite", tinkerDigitalWrite);
  Spark.function("analogread", tinkerAnalogRead);
  Spark.function("analogwrite", tinkerAnalogWrite);
}

void loop() {
}

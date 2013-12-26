int LED = D7;

void setup() {
  pinMode(LED, OUTPUT);

  Spark.function("digitalread", tinkerDigitalRead);
  Spark.function("digitalwrite", tinkerDigitalWrite);
  Spark.function("analogread", tinkerAnalogRead);
  Spark.function("analogwrite", tinkerAnalogWrite);
}

void loop() {
  digitalWrite(LED, HIGH);
  delay(1000);
  digitalWrite(LED, LOW);
  delay(1000);
}

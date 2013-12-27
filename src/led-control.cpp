int LED = D7;
int state = 0;

int ledControl(String command) {
  if (command == "HIGH") {
    digitalWrite(LED, HIGH);
    state = 1;
  } else if (command == "LOW") {
    digitalWrite(LED, LOW);
    state = 0;
  } else {
    return -1;
  }

  return 1;
}

void setup() {
  pinMode(LED, OUTPUT);
  Spark.function("led", ledControl);
  Spark.variable("state", &state, INT);

  Spark.function("digitalread", tinkerDigitalRead);
  Spark.function("digitalwrite", tinkerDigitalWrite);
  Spark.function("analogread", tinkerAnalogRead);
  Spark.function("analogwrite", tinkerAnalogWrite);

  digitalWrite(LED, LOW);
}

void loop() {
}

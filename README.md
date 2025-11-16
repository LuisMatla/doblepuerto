# 🔌 Práctica 1: Doble Puerto - PIC16F877A

## 📋 Descripción

Este proyecto implementa un sistema de control de doble puerto utilizando el microcontrolador **PIC16F877A**. El programa lee el estado de 4 bits de entrada desde el **PORTB** (bits 0-3) y controla 8 bits de salida en el **PORTD**, activando dos salidas por cada entrada.

### 🎯 Funcionalidad

- **PORTB** (bits 0-3): Configurado como entrada para leer el estado de 4 interruptores o sensores
- **PORTD** (bits 0-7): Configurado como salida para controlar LEDs, relés u otros dispositivos

### 🔄 Mapeo de Entradas y Salidas

| Entrada (PORTB) | Salidas Activadas (PORTD) |
|----------------|---------------------------|
| Bit 0          | Bit 0 y Bit 4             |
| Bit 1          | Bit 1 y Bit 5             |
| Bit 2          | Bit 2 y Bit 6             |
| Bit 3          | Bit 3 y Bit 7             |

Cuando una entrada está en **nivel alto (1)**, se activan sus dos salidas correspondientes. Cuando está en **nivel bajo (0)**, las salidas se desactivan.

## 📖 Instrucción de la Práctica

Sea el puerto D la salida del sistema donde se conectan 8 leds (el pic funciona como tierra) y en el puerto B están conectados 4PB (RB3 a RB0) donde cuando se encuentren en estado basal (sin tocarlos) otorgan al pic 5V y al pulsarlos otorguen 0V, genere el circuito lógico y la carta asm para que lo que se introduce en el puerto B sea reflejado en ambos nibbles del puerto D.

**Ejemplo:** 
- `puertoB = "XXXX1100"` → `puertoD = "11001100"`

Donde los 4 bits menos significativos del PORTB (RB3-RB0) se reflejan tanto en el nibble superior como en el nibble inferior del PORTD.

## 🔧 Tecnologías Utilizadas

![PIC16F877A](https://img.shields.io/badge/PIC16F877A-Microcontroller-blue?style=flat-square)
![Assembly](https://img.shields.io/badge/Assembly-Language-green?style=flat-square)
![MPLAB](https://img.shields.io/badge/MPLAB_X-IDE-orange?style=flat-square)
![Proteus](https://img.shields.io/badge/Proteus-Simulation-purple?style=flat-square)

## 🛠️ Materiales Necesarios

### Componentes Electrónicos

- 🔹 **1x Microcontrolador PIC16F877A**
- 🔹 **1x Cristal oscilador 4MHz** (o según configuración)
- 🔹 **2x Capacitores cerámicos 22pF** (para el cristal)
- 🔹 **1x Resistencia pull-up 10kΩ** (opcional, para MCLR)
- 🔹 **4x Interruptores o pulsadores** (para PORTB)
- 🔹 **8x LEDs** con resistencias limitadoras (220Ω - 1kΩ)
- 🔹 **8x Resistencias 220Ω - 1kΩ** (para los LEDs)
- 🔹 **1x Capacitor electrolítico 100µF** (filtro de alimentación)
- 🔹 **1x Capacitor cerámico 0.1µF** (desacoplamiento)
- 🔹 **Fuente de alimentación 5V DC** o regulador 7805
- 🔹 **Cables dupont o protoboard** para conexiones

### Herramientas y Software

- 💻 **MPLAB X IDE** o **MPLAB IDE**
- 🔧 **Compilador XC8** o **MPASM**
- 📡 **Programador PIC** (PICKit, ICD, etc.)
- 🔌 **Proteus ISIS** o **Proteus Professional** (para simulación)
- 📐 **Protoboard** o **PCB** para montaje
- 🔨 **Soldador** (si se usa PCB)

## 📁 Estructura del Proyecto

```
practica(1)/
├── README.md                    # Este archivo
├── practica1.pdsprj            # Proyecto de Proteus
├── practica1.X/
│   └── practica1.asm           # Código fuente en ensamblador
└── dist/
    └── default/
        └── production/
            └── practica1.X.production.hex  # Archivo HEX para programar
```

## 💻 Código

El código está escrito en **ensamblador PIC** y está completamente comentado línea por línea para facilitar su comprensión.

### Características del Código

- ✅ Configuración de puertos (PORTB como entrada, PORTD como salida)
- ✅ Manejo de bancos de memoria del PIC
- ✅ Subrutinas modulares para cada entrada
- ✅ Bucle principal infinito para lectura continua
- ✅ Comentarios descriptivos en cada línea

## 🚀 Instalación y Uso

### 1. Clonar el Repositorio

```bash
git clone https://github.com/LuisMatla/doblepuerto.git
cd doblepuerto
```

### 2. Abrir en MPLAB X

1. Abre **MPLAB X IDE**
2. File → Open Project
3. Selecciona el archivo `practica1.pdsprj` o importa el proyecto

### 3. Compilar el Proyecto

1. Build → Build Main Project (F11)
2. Verifica que no haya errores en la compilación
3. El archivo `.hex` se generará en `dist/default/production/`

### 4. Programar el PIC

1. Conecta tu programador PIC al microcontrolador
2. Tools → Select Tool → [Tu Programador]
3. Production → Build and Program Main Project
4. Espera a que termine la programación

### 5. Simular en Proteus (Opcional)

1. Abre `practica1.pdsprj` en **Proteus ISIS**
2. Ejecuta la simulación
3. Prueba activando/desactivando los interruptores en PORTB

## 🔧 Configuración del Hardware

### Conexiones PORTB (Entradas)

Los pulsadores están conectados de manera que:
- **Estado basal (sin pulsar):** Otorgan 5V al PIC (nivel alto)
- **Al pulsar:** Otorgan 0V al PIC (nivel bajo)

```
PORTB.0 → Pulsador 1 → +5V (pull-up interno o externo)
PORTB.1 → Pulsador 2 → +5V (pull-up interno o externo)
PORTB.2 → Pulsador 3 → +5V (pull-up interno o externo)
PORTB.3 → Pulsador 4 → +5V (pull-up interno o externo)
```

### Conexiones PORTD (Salidas)

El PIC funciona como **tierra (sink)** para los LEDs. La configuración es:

```
+5V → Resistencia 220Ω → LED → PORTD.X → PIC (tierra)
```

Conexiones específicas:
```
+5V → Resistencia 220Ω → LED 1 → PORTD.0 → PIC
+5V → Resistencia 220Ω → LED 2 → PORTD.1 → PIC
+5V → Resistencia 220Ω → LED 3 → PORTD.2 → PIC
+5V → Resistencia 220Ω → LED 4 → PORTD.3 → PIC
+5V → Resistencia 220Ω → LED 5 → PORTD.4 → PIC
+5V → Resistencia 220Ω → LED 6 → PORTD.5 → PIC
+5V → Resistencia 220Ω → LED 7 → PORTD.6 → PIC
+5V → Resistencia 220Ω → LED 8 → PORTD.7 → PIC
```

### Alimentación

```
VDD (Pin 11, 32) → +5V
VSS (Pin 12, 31) → GND
```

### Oscilador

```
OSC1 (Pin 13) → Cristal 4MHz
OSC2 (Pin 14) → Cristal 4MHz
Capacitores 22pF desde cada pin a GND
```

## 🖥️ Simulación del Circuito

A continuación se muestra el circuito simulado en **Proteus ISIS**:

**Descripción del Circuito Simulado:**

El circuito muestra el microcontrolador **PIC16F877A** conectado a:

- **8 LEDs (D1-D8):** Conectados al PORTD (RD0-RD7) con resistencias limitadoras de 220Ω. Los LEDs están configurados con el PIC como sumidero de corriente (sink), por lo que se encienden cuando el pin del PORTD está en estado bajo (0V).

- **4 Pulsadores (R1-R4):** Conectados al PORTB (RB0-RB3) con resistencias pull-down de 220Ω. Cuando un pulsador no está presionado, el pin del PORTB está en estado bajo (0V). Al presionar el pulsador, el pin se conecta a +5V, resultando en estado alto.

**Componentes del Circuito:**
- Microcontrolador PIC16F877A (U1)
- 8 LEDs blancos (D1-D8)
- 8 Resistencias de 220Ω para los LEDs (R5-R12)
- 4 Pulsadores (R1-R4)
- 4 Resistencias pull-down de 220Ω (R1-R4)
- Alimentación +5V y GND

## ✅ Sistema Funcionando

A continuación se muestra el circuito físico montado en protoboard y funcionando correctamente:

**Descripción del Sistema Físico:**

El circuito está montado en una protoboard y muestra:

- **Microcontrolador PIC16F877A:** Montado en el centro de la protoboard con sus 40 pines conectados correctamente.

- **Cristal Oscilador 4MHz:** Conectado a los pines 13 y 14 del PIC, con dos capacitores cerámicos de 22pF conectados a tierra.

- **8 LEDs Amarillos:** Conectados al PORTD (RD0-RD7) del PIC, cada uno con su resistencia limitadora de 220Ω. Los LEDs se encienden cuando el pin correspondiente está activo, mostrando el resultado de la operación.

- **DIP Switch de 4 Posiciones:** Conectado al PORTB (RB0-RB3) del PIC, permitiendo configurar el valor de entrada de 4 bits. Cada switch tiene una resistencia para la configuración pull-up/pull-down.

- **Conexiones de Alimentación:** Cables rojo y negro conectados a los rieles de alimentación de la protoboard (+5V y GND).

**Estado del Sistema:**
El sistema está funcionando correctamente, leyendo los valores del PORTB y reflejándolos en ambos nibbles del PORTD, tal como se muestra en la imagen donde los primeros LEDs están encendidos según la configuración de los switches.

## 📊 Diagrama de Funcionamiento

```
┌─────────────┐
│  PORTB.0    │───┐
│  PORTB.1    │───┤
│  PORTB.2    │───┤───┐
│  PORTB.3    │───┘   │
└─────────────┘       │
                      │
              ┌───────▼───────┐
              │  PIC16F877A   │
              │   (Lógica)    │
              └───────┬───────┘
                      │
┌─────────────┐       │
│  PORTD.0    │◄──────┘
│  PORTD.1    │
│  PORTD.2    │
│  PORTD.3    │
│  PORTD.4    │
│  PORTD.5    │
│  PORTD.6    │
│  PORTD.7    │
└─────────────┘
```

## 🧪 Pruebas

### Prueba Básica

1. ✅ Alimenta el circuito con 5V
2. ✅ Presiona el interruptor conectado a PORTB.0
3. ✅ Verifica que se enciendan los LEDs en PORTD.0 y PORTD.4
4. ✅ Repite para los demás interruptores

### Tabla de Verdad

| PORTB.3 | PORTB.2 | PORTB.1 | PORTB.0 | PORTD.7 | PORTD.6 | PORTD.5 | PORTD.4 | PORTD.3 | PORTD.2 | PORTD.1 | PORTD.0 |
|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|
| 0       | 0       | 0       | 0       | 0       | 0       | 0       | 0       | 0       | 0       | 0       | 0       |
| 0       | 0       | 0       | 1       | 0       | 0       | 0       | 1       | 0       | 0       | 0       | 1       |
| 0       | 0       | 1       | 0       | 0       | 0       | 1       | 0       | 0       | 0       | 1       | 0       |
| 0       | 1       | 0       | 0       | 0       | 1       | 0       | 0       | 0       | 1       | 0       | 0       |
| 1       | 0       | 0       | 0       | 1       | 0       | 0       | 0       | 1       | 0       | 0       | 0       |

## 📝 Notas Técnicas

- El programa utiliza un **bucle infinito** para leer continuamente las entradas
- Se implementan **subrutinas modulares** para facilitar el mantenimiento
- El código maneja correctamente los **bancos de memoria** del PIC16F877A
- La configuración de puertos se realiza en el **banco 1** (TRISB, TRISD)
- Las operaciones de lectura/escritura se realizan en el **banco 0** (PORTB, PORTD)

## 👨‍💻 Autor

**Luis Fernando Contreras Matla.**

## 📚 Información Académica

Esta práctica fue desarrollada como parte de la Experiencia Educativa:

- **Materia:** Microprocesadores y Microcontroladores
- **Universidad:** Universidad Veracruzana
- **Facultad:** Ingeniería Eléctrica y Electrónica
- **Docente:** Rosa María Woo García

## 📄 Licencia

Este proyecto es de uso educativo y académico.


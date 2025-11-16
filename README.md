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

```
PORTB.0 → Interruptor 1 → GND
PORTB.1 → Interruptor 2 → GND
PORTB.2 → Interruptor 3 → GND
PORTB.3 → Interruptor 4 → GND
```

### Conexiones PORTD (Salidas)

```
PORTD.0 → LED 1 (con resistencia 220Ω) → GND
PORTD.1 → LED 2 (con resistencia 220Ω) → GND
PORTD.2 → LED 3 (con resistencia 220Ω) → GND
PORTD.3 → LED 4 (con resistencia 220Ω) → GND
PORTD.4 → LED 5 (con resistencia 220Ω) → GND
PORTD.5 → LED 6 (con resistencia 220Ω) → GND
PORTD.6 → LED 7 (con resistencia 220Ω) → GND
PORTD.7 → LED 8 (con resistencia 220Ω) → GND
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


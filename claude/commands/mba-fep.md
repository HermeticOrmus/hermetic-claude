---
description: Apply FEP (Formulacion y Evaluacion de Proyectos) 5-step analysis to a project
---

# FEP Analysis Skill

Apply the 5-step FEP process to evaluate a project investment decision.

## Instructions

When invoked, guide the user through:

### 1. Gather Project Context
- What is the project?
- What financial data is available?
- What is the investment horizon?

### 2. Apply the 5 Steps

**Paso 1: IDENTIFICAR**
- Define el versus: Proyecto vs Alternativa
- List costos de inversion (one-time)
- List costos de operacion (recurring)
- List beneficios esperados
- Identify capital de trabajo needs

**Paso 2: MEDIR**
- Quantify all elements physically
- Users, units, hours, quantities
- Growth projections by year

**Paso 3: VALORAR**
- Convert to market prices (USD)
- Research current market rates
- Be conservative at Perfil level

**Paso 4: ORDENAR**
- Define horizonte de evaluacion (years)
- Create flujo de fondos
- Investments → inicio del periodo
- Operations → fin del periodo
- N years = N+1 moments

**Paso 5: COMPARAR**
- Define tasa exigida (15-20% for startups, 10-12% for established)
- Calculate VAN: `VAN = -Inv + Σ(Flujo_t / (1+i)^t)`
- Calculate IAM: `IAM = Costo Op + (Tasa × Inversion)`
- Emit dictamen: VAN > 0 = crear valor, VAN < 0 = destruir valor

### 3. Formulas Reference

```
VAN = -Inversion_0 + F1/(1+i)^1 + F2/(1+i)^2 + ... + Fn/(1+i)^n

Ingreso Anual Minimo = Costo Operacion + Costo Financiero

Tasa Exigida = Tasa Libre Riesgo (4%) + Prima Riesgo (varies)
  - Low risk: 6-8% prima
  - Medium risk: 10-12% prima
  - High risk (startup): 14-18% prima
```

### 4. Key Concepts
- **Costo marginal**: Only exists if we do the project (evitable)
- **Costo hundido**: Exists regardless of decision (inevitable, ignore it)
- **Costo de oportunidad**: Best alternative foregone
- **Depreciacion economica**: Real market value loss (vs contable)

### 5. Output
Provide structured analysis with:
- Clear dictamen (avanzar / no avanzar / revisar)
- Key assumptions to refine in Prefactibilidad
- Sensitivity analysis on critical variables

## Example Usage
```
User: /mba-fep
Claude: What project would you like to evaluate? I'll guide you through the 5-step FEP process...
```

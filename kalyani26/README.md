# JK Flip-Flop to D Flip-Flop Conversion using Verilog HDL

## Description

This project demonstrates the conversion of a JK Flip-Flop into a D Flip-Flop using Verilog HDL.

A JK Flip-Flop has two inputs, `J` and `K`, while a D Flip-Flop has only one input, `D`.

To convert a JK Flip-Flop into a D Flip-Flop, connect the D input directly to J and connect the inverted D input to K.

## Conversion Equations

```text
J = D
K = D'
```

In Verilog:

```verilog
assign J = D;
assign K = ~D;
```

## D Flip-Flop Truth Table

| D | J | K | Q(next) | Operation |
| - | - | - | ------- | --------- |
| 0 | 0 | 1 | 0       | Reset     |
| 1 | 1 | 0 | 1       | Set       |

The JK combinations `00` and `11` are not required for this conversion.

## JK Flip-Flop Truth Table

| J | K | Q(next) | Operation |
| - | - | ------- | --------- |
| 0 | 0 | Q       | No Change |
| 0 | 1 | 0       | Reset     |
| 1 | 0 | 1       | Set       |
| 1 | 1 | Q'      | Toggle    |

After applying:

```text
J = D
K = D'
```

the JK Flip-Flop uses only the Set and Reset operations.

## Working

### Case 1: D = 0

When:

```text
D = 0
```

the conversion gives:

```text
J = 0
K = 1
```

For a JK Flip-Flop:

```text
J = 0, K = 1 → Reset
```

Therefore:

```text
Q(next) = 0
```

### Case 2: D = 1

When:

```text
D = 1
```

the conversion gives:

```text
J = 1
K = 0
```

For a JK Flip-Flop:

```text
J = 1, K = 0 → Set
```

Therefore:

```text
Q(next) = 1
```

Hence:

```text
Q(next) = D
```

which is exactly the behavior of a D Flip-Flop.

## Block Diagram

```text
                  ┌───────────────┐
        D ───────►│ J             │
        │         │               │
        │         │      JK       │────► Q
        │         │   Flip-Flop   │
        │    ┌───►│ K             │
        │    │    └───────────────┘
        │    │
        │   NOT
        │    │
        └────┘

        J = D
        K = D'
```

## Project Structure

```text
JK_to_D_FlipFlop/
│
├── flipflop.v
├── tb.v
└── README.md
```

## Files Description

### `flipflop.v`

Contains the Verilog HDL implementation of the JK-to-D Flip-Flop conversion.

### `tb.v`

Contains the testbench used to verify the conversion.

### `README.md`

Contains the project description, conversion equations, truth table, working, and simulation instructions.

## Software Required

* Visual Studio Code
* Icarus Verilog
* GTKWave

## How to Run in VS Code

Open the `JK_to_D_FlipFlop` folder in Visual Studio Code.

Open the VS Code terminal.

### Step 1: Compile

```bash
iverilog -o flipflop_sim flipflop.v tb.v
```

### Step 2: Run Simulation

```bash
vvp flipflop_sim
```

### Step 3: View Waveform

The simulation generates:

```text
flipflop.vcd
```

Open it using:

```bash
gtkwave flipflop.vcd
```

In GTKWave, add:

```text
clk
D
J
K
Q
Qbar
```

## Expected Output

```text
Time    CLK D J K Q Qbar
0       0   0 0 1 0 1
5       1   0 0 1 0 1
15      1   0 0 1 0 1
25      1   1 1 0 1 0
35      1   0 0 1 0 1
45      1   1 1 0 1 0
55      1   1 1 0 1 0
65      1   0 0 1 0 1
```

## Output Explanation

The output follows the D input at every positive edge of the clock.

```text
D = 0 → J = 0, K = 1 → Q = 0

D = 1 → J = 1, K = 0 → Q = 1
```

Therefore:

```text
Q(next) = D
```

## Result

The JK Flip-Flop was successfully converted into a D Flip-Flop using Verilog HDL.

### Final Conversion

```text
J = D
K = D'
```

The converted circuit successfully performs the required D Flip-Flop operation.

## GitHub Upload

Recommended repository name:

```text
JK_to_D_FlipFlop
```

Run these commands in the VS Code terminal:

```bash
git init
git add .
git commit -m "Add JK to D Flip-Flop conversion"
git branch -M main
git remote add origin YOUR_GITHUB_REPOSITORY_URL
git push -u origin main
```

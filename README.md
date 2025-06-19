# Match Pairs

A zero-knowledge implementation of the classic memory card matching game. This project uses Noir, a domain-specific language for zero-knowledge proofs, to verify that a player has correctly matched pairs of cards without revealing the actual card positions.

## Overview

In the traditional memory card matching game, players need to find pairs of matching cards by flipping them over. In this zero-knowledge version:

1. The game setup is hidden from the player
2. When a player makes two choices, they can prove they found a match without revealing the actual card positions
3. The verification is done through zero-knowledge proofs, ensuring the game remains fair and the solution stays hidden

## How It Works

The game uses a Noir program to verify matches:

- The game state is represented as an array of 16 single-character strings
- Each pair of matching cards has the same character
- When a player makes two choices, they provide:
  - The array of all possible cards (`pairing_options`)
  - Two indices (`first_choice` and `second_choice`)
- The program verifies that the cards at these indices match, without revealing their positions

## Project Structure

```
match_pairs/
├── src/                  # Noir source code
│   └── main.nr           # Core game logic and proof generation
├── contracts/            # Smart contracts
│   └── src/              # Solidity source code
│       ├── Verifier.sol  # Auto-generated verification contract
│       └── Game.sol      # Game logic contract
└── target/               # Build artifacts
```

## Technical Details

The project consists of two main components:

1. **Noir Program** (`src/main.nr`):

   - Implements the core game logic
   - Generates zero-knowledge proofs for matches
   - Verifies that chosen cards match without revealing positions

2. **Smart Contracts** (`contracts/src/`):
   - `Verifier.sol`: Auto-generated contract for proof verification
   - `Game.sol`: Implements the game state and player interactions

## Getting Started

### Prerequisites

- [Noir](https://noir-lang.org/) development environment
- [Barretenberg](https://github.com/AztecProtocol/barretenberg) for proof generation
- A compatible proving system

### Building

The project uses a Makefile to automate the build process:

```bash
# Build everything (compile Noir, generate verification key, and create verifier contract)
make

# Or run individual steps:
make compile           # Compile the Noir program
make generate-vk       # Generate the verification key
make generate-verifier # Generate the Solidity verifier
make clean             # Clean build artifacts
```

### Testing

```bash
# Run Noir tests
nargo test
```

## Security

This implementation ensures:

- The game state remains hidden
- Players cannot cheat by seeing the card positions
- Matches are verified cryptographically
- The solution cannot be derived from the proof

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

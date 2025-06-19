.PHONY: all clean compile generate-vk generate-verifier

# Default target
all: compile generate-vk generate-verifier

# Clean build artifacts
clean:
	rm -rf target/
	rm -rf contracts/src/Verifier.sol

# Compile the Noir program
compile:
	nargo compile

# Generate verification key
generate-vk:
	bb write_vk --oracle_hash keccak -b ./target/match_pairs.json -o ./target

# Generate Solidity verifier
generate-verifier:
	bb write_solidity_verifier -k ./target/vk -o ./target/Verifier.sol
	mkdir -p contracts/src
	mv ./target/Verifier.sol ./contracts/src/

# Development workflow
dev: clean all 
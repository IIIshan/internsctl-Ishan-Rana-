Certainly! Here's the complete markdown content:

```markdown
# internsctl - Custom Linux Command

`internsctl` is a custom Linux command designed to provide various system management operations. It addresses specific needs outlined by a customer. This document provides an overview of the features, commands, and usage guidelines for `internsctl`.

- **Command Name:** `internsctl`
- **Command Version:** v0.1.0

## Table of Contents

- [Sections](#sections)
  - [A. Basic Commands](#a-basic-commands)
  - [B. Commands by Difficulty Level](#b-commands-by-difficulty-level)
    - [Part 1 | Level Easy](#part-1--level-easy)
    - [Part 2 | Level Intermediate](#part-2--level-intermediate)
    - [Part 3 | Advanced Level](#part-3--advanced-level)
- [Usage](#usage)
- [Installation](#installation)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Sections

### A. Basic Commands

1. **Manual Page**

   To view the full documentation of the command, execute:

   ```bash
   man internsctl
   ```

2. **Help Option**

   To view usage guidelines and examples, use the `--help` option:

   ```bash
   internsctl --help
   ```

3. **Version**

   To view the version of the command, execute:

   ```bash
   internsctl --version
   ```

### B. Commands by Difficulty Level

#### Part 1 | Level Easy

1. **Get CPU Information**

   ```bash
   internsctl cpu getinfo
   ```

   Expected Output: Similar to `lscpu` command.

2. **Get Memory Information**

   ```bash
   internsctl memory getinfo
   ```

   Expected Output: Similar to `free` command.

#### Part 2 | Level Intermediate

1. **Create a New User**

   ```bash
   internsctl user create <username>
   ```

   Create a new user with login access.

2. **List Regular Users**

   ```bash
   internsctl user list
   ```

3. **List Users with Sudo Permissions**

   ```bash
   internsctl user list --sudo-only
   ```

#### Part 3 | Advanced Level

1. **Get File Information**

   ```bash
   internsctl file getinfo <file-name>
   ```

   Expected Output: Detailed file information.

   - **Options:**
     - `--size, -s`: Print size of the file.
     - `--permissions, -p`: Print file permissions.
     - `--owner, -o`: Print file owner.
     - `--last-modified, -m`: Print last modified time.

   - **Example Options Usage:**
     - Size: `internsctl file getinfo --size <file-name>`
     - Permissions: `internsctl file getinfo --permissions <file-name>`
     - Owner: `internsctl file getinfo --owner <file-name>`
     - Last Modified: `internsctl file getinfo --last-modified <file-name>`

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/internsctl.git
   ```

2. Make the script executable:

   ```bash
   chmod +x internsctl
   ```

3. Run the script:

   ```bash
   ./internsctl <command> [options]
   ```

## Installation

To install `internsctl` system-wide and make it available in the PATH, you can use the following commands:

```bash
sudo cp internsctl /usr/bin/
sudo chmod +x /usr/bin/internsctl
```

## Examples

- Display CPU information:

  ```bash
  internsctl cpu getinfo
  ```

- Create a new user:

  ```bash
  internsctl user create john_doe
  ```

- Get information about a file's size:

  ```bash
  internsctl file getinfo --size example.txt
  ```

## Contributing

Contributions are welcome! If you have any improvements, bug fixes, or new features to propose, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
```

You can copy and paste this content directly into your README.md file on GitHub.

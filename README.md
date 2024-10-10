
# gtree

`gtree` is a flexible command-line tool designed to generate a directory tree structure with customizable parent and child directory visibility. This tool allows users to view directory trees with adjustable depth levels and provides an interactive menu for easy configuration.

## Features

- **Parent and Child Directory Control**: Easily set the number of parent and child directories visible in the tree.
- **Interactive Menu**: Navigate through a menu to choose your settings without needing command-line arguments.
- **Command-line Options**: Customize your tree generation using straightforward arguments.
- **ASCII Art and Branding**: Includes custom ASCII art and attribution to the author.
- **Help Menu**: Built-in help command for quick reference to available options.

## Installation

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-github-username/gtree.git
   ```

2. Make the script executable:
   ```bash
   chmod +x gtree.sh
   ```

3. Optionally, move the script to `/usr/local/bin` to make it available globally:
   ```bash
   sudo mv gtree.sh /usr/local/bin/gtree
   ```

4. Now, you can use `gtree` from anywhere on your system:
   ```bash
   gtree --help
   ```

## Usage

Run the script with various options to control parent and child directory visibility.

```bash
gtree [OPTIONS]
```

### Command-line Options:

- `--help`: Displays the help menu and exits.
- `--menu`: Opens the interactive menu to select parent and child depths.
- `--p0`: No parent directory visible.
- `--p1`: One parent directory visible (default).
- `--p2`: Two parent directories visible.
- `--c1`: Show one child layer.
- `--c2`: Show two child layers (default).
- `--c3`: Show three child layers.
- `--c4`: Show four child layers (not recommended for large directories).

### Example:

```bash
gtree --p1 --c3
```

This command displays one parent directory and up to three child directory layers.

### Using the Interactive Menu:

```bash
gtree --menu
```

This command opens the interactive menu where you can select parent and child depths for your directory tree.

## Versioning

This project follows [Semantic Versioning](https://semver.org/). The current version is:

```
v1.0.0
```

**Version Format:**

- **Major**: Major changes that break backward compatibility.
- **Minor**: New features that maintain backward compatibility.
- **Patch**: Bug fixes.
- **Build**: Incremental changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Authored by Aaron Galipeau © 2024.

# Basic System Setup Script

This is a basic Bash script designed to test and demonstrate various system configurations and setup tasks. It includes options to modify system settings, install dependencies, configure language settings, and install various Kali Linux tools and desktop environments.

## Features

The script provides the following functionalities:

1. **Kali Linux Tools Setup**: Installs a predefined set of Kali Linux tools.
2. **Dependency Check**: Verifies if essential dependencies (such as `apt`, `curl`, `wget`, and `git`) are installed, and installs them if not.
3. **System Configuration**: Offers the option to configure the system language, keyboard layout, and timezone for Portuguese (Brazil).
4. **Customize Desktop Environments (DEs)**: Allows you to install different desktop environments like XFCE, GNOME, and KDE.
5. **Install Terminals**: Option to install terminal emulators like Kitty, Terminator, and Konsole.

## Prerequisites

- A Debian-based system (such as Ubuntu, Kali Linux, etc.)
- Root privileges (required to install packages and modify system settings)
- Bash shell

## Usage

1. Clone the repository or download the script.
2. Make the script executable:
   ```bash
   chmod +x setup-script.sh
   ```
3. Run the script:
   ```bash
   sudo ./setup-script.sh
   ```

4. Follow the on-screen menu options to perform various actions, such as installing Kali Linux tools or configuring system settings.

## Menu Options

- **Kali Tools Sets**: Install different sets of Kali Linux tools, such as default tools, all tools, penetration testing tools, and more.
- **Customization**: Choose and install your preferred Desktop Environment (DE) or terminal emulator.
- **Configure system for Portuguese**: Set the system language to Portuguese, configure the keyboard layout to ABNT2, and set the timezone to São Paulo, Brazil.
- **Exit**: Exit the script.

## Example Usage

### Installing Kali Tools:
```
$ sudo ./setup-script.sh
Select your choice below: 1
Select the tools you want to download: 1
Installing Kali Linux Default Tools...
```

### Customizing the Desktop Environment:
```
$ sudo ./setup-script.sh
Select your choice below: 2
Select the desired option: 3
Installing GNOME Desktop Environment...
```

### Configuring the System for Portuguese:
```
$ sudo ./setup-script.sh
Select your choice below: 3
Configuring the system for Portuguese...
Language set to pt_BR.UTF-8
Keyboard layout set to ABNT2
Timezone set to São Paulo
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
